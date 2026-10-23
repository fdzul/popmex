test_that("census datasets are numeric and consistent", {
    for (x in list(pop2000, pop2010, pop2020)) {
        expect_type(x$CVEGEO, "character")
        expect_true(all(nchar(x$CVEGEO) == 5))
        expect_false(anyDuplicated(x$CVEGEO) > 0)
        expect_true(all(vapply(x[-1], is.numeric, logical(1))))
        expect_equal(x$pobtot, x$pobfem + x$pobmas)
    }
})

test_that("census totals match INEGI", {
    expect_equal(sum(pop2000$pobtot), 97483412)
    expect_equal(sum(pop2010$pobtot), 112336538)
    expect_equal(sum(pop2020$pobtot), 126014024)
})

test_that("conapop covers every municipality, sex and year", {
    expect_equal(length(unique(conapop$cvegeo)), 2475)
    expect_setequal(unique(conapop$sexo), c("HOMBRES", "MUJERES"))
    expect_equal(range(conapop$ano), c(1990, 2040))
    expect_equal(nrow(conapop), 2475 * 2 * length(1990:2040))
})

test_that("hexagon datasets are sf in EPSG:4326 with population", {
    for (x in list(hdx_pop2021, hdx_pop2022, hdx_pop2023)) {
        expect_s3_class(x, "sf")
        expect_equal(sf::st_crs(x)$epsg, 4326L)
        expect_true(all(x$population > 0))
    }
})
