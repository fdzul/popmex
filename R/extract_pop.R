#' Extract the population of a locality in 400 m H3 hexagons
#'
#' Selects the hexagons of the Kontur/HDX population density dataset
#' (`hdx_pop2021`, `hdx_pop2022` or `hdx_pop2023`) that intersect one or
#' several urban localities of a state. The locality boundaries come from
#' the INEGI 2019 localities of the [rgeomex](https://fdzul.github.io/rgeomex/)
#' package.
#'
#' @param year year of the population dataset: 2021, 2022 or 2023.
#' @param cve_edo two-digit state code of INEGI, as text (e.g. `"14"` for
#'   Jalisco, `"31"` for Yucatán).
#' @param locality name or names of the target localities. The names do not
#'   need to be exact: the most similar name of the state is used
#'   (e.g. `"Merida"` finds `"Mérida"`).
#'
#' @return an `sf` object (EPSG:4326) with the hexagons that intersect the
#'   localities and their population (`population`).
#' @export
#'
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @seealso [hdx_pop2023], [hdx_pop2022], [hdx_pop2021],
#'   [rgeomex::extract_locality()]
#'
#' @examples
#' \donttest{
#' if (requireNamespace("rgeomex", quietly = TRUE)) {
#'   merida <- extract_pop(year = 2023, cve_edo = "31", locality = "Merida")
#'   sum(merida$population)
#' }
#' }
extract_pop <- function(year = 2023, cve_edo, locality){

    years <- c("2021", "2022", "2023")
    year <- as.character(year)
    if (length(year) != 1 || !year %in% years) {
        stop("`year` must be one of ", paste(years, collapse = ", "),
             ". Got: ", paste(year, collapse = ", "), call. = FALSE)
    }
    if (missing(cve_edo) || missing(locality)) {
        stop("`cve_edo` and `locality` are required.", call. = FALSE)
    }

    # Step 1. boundaries of the localities ####
    loc <- rgeomex::extract_locality(cve_edo = cve_edo,
                                     locality = locality)
    if (nrow(loc) == 0) {
        stop("No locality found for cve_edo = \"", cve_edo,
             "\" and locality = \"", paste(locality, collapse = "\", \""),
             "\".", call. = FALSE)
    }

    # Step 2. population dataset of the year ####
    pop <- switch(year,
                  "2021" = popmex::hdx_pop2021,
                  "2022" = popmex::hdx_pop2022,
                  "2023" = popmex::hdx_pop2023)

    # Step 3. hexagons that intersect the localities ####
    loc <- sf::st_transform(loc, sf::st_crs(pop))
    sf::st_filter(pop, loc)
}
