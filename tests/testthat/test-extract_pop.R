test_that("extract_pop() validates its arguments", {
    expect_error(extract_pop(year = 2020, cve_edo = "31", locality = "Merida"),
                 "must be one of 2021, 2022, 2023")
    expect_error(extract_pop(year = c(2022, 2023), cve_edo = "31",
                             locality = "Merida"), "must be one of")
    expect_error(extract_pop(year = 2023), "are required")
})

test_that("extract_pop() returns the hexagons of a locality", {
    skip_if_not_installed("rgeomex")
    skip_on_cran()

    x <- extract_pop(year = 2023, cve_edo = "31", locality = "Merida")
    loc <- rgeomex::extract_locality(cve_edo = "31", locality = "Merida")

    expect_s3_class(x, "sf")
    expect_gt(nrow(x), 100)
    expect_true(all(lengths(sf::st_intersects(x, loc)) > 0))
    expect_identical(names(x), names(hdx_pop2023))
})
