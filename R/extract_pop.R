#' extracts the population density at the locality level in hexagons of 400 meters resolution for the years 2023 and 2022
#'
#' @param year is the year dataset
#' @param cve_edo is the id of state.
#' @param locality is the target locality.
#'
#' @return a sf object
#' @export
#'
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#' @examples popmex::extract_pop(year = 2023, cve_edo = "31", locality = "Merida")

extract_pop <- function(year, cve_edo, locality){
    if(year == 2023){
        y <- rgeomex::extract_locality(cve_edo = cve_edo,
                                       locality = locality)
        popmex::hdx_pop2023[y,]
    } else if(year == 2022){
        y <- rgeomex::extract_locality(cve_edo = cve_edo,
                                       locality = locality)
        popmex::hdx_pop2022[y,]
    } else{}

}
