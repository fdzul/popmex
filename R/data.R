#' Population in 400 m H3 hexagons of Mexico, 2023 (Kontur / HDX)
#'
#' Estimated number of inhabitants in each H3 hexagon of resolution 8
#' (about 400 m across) of Mexico, from the Kontur Population dataset
#' published in the Humanitarian Data Exchange (HDX). Only hexagons with
#' population are included.
#'
#' @format An `sf` data frame (EPSG:4326, POLYGON geometries) with 456,514 rows:
#' \describe{
#'   \item{h3}{H3 index of the hexagon (resolution 8).}
#'   \item{population}{estimated number of inhabitants in the hexagon.}
#'   \item{geom}{hexagon geometry.}
#' }
#'
#' @seealso [extract_pop()] to extract the hexagons of a locality.
#' @source <https://data.humdata.org/dataset/kontur-population-mexico>
"hdx_pop2023"

#' Population in 400 m H3 hexagons of Mexico, 2022 (Kontur / HDX)
#'
#' Estimated number of inhabitants in each H3 hexagon of resolution 8
#' (about 400 m across) of Mexico, from the Kontur Population dataset
#' published in the Humanitarian Data Exchange (HDX). Only hexagons with
#' population are included.
#'
#' @format An `sf` data frame (EPSG:4326, POLYGON geometries) with 463,830 rows:
#' \describe{
#'   \item{h3}{H3 index of the hexagon (resolution 8).}
#'   \item{population}{estimated number of inhabitants in the hexagon.}
#'   \item{geom}{hexagon geometry.}
#' }
#'
#' @seealso [extract_pop()] to extract the hexagons of a locality.
#' @source <https://data.humdata.org/dataset/kontur-population-mexico>
"hdx_pop2022"

#' Population in 400 m H3 hexagons of Mexico, 2021 (Kontur / HDX)
#'
#' Estimated number of inhabitants in each H3 hexagon of resolution 8
#' (about 400 m across) of Mexico, from the Kontur Population dataset
#' published in the Humanitarian Data Exchange (HDX). Only hexagons with
#' population are included. This edition has no `h3` column.
#'
#' @format An `sf` data frame (EPSG:4326, MULTIPOLYGON geometries) with 362,028 rows:
#' \describe{
#'   \item{population}{estimated number of inhabitants in the hexagon.}
#'   \item{geom}{hexagon geometry.}
#' }
#'
#' @seealso [extract_pop()] to extract the hexagons of a locality.
#' @source <https://data.humdata.org/dataset/kontur-population-mexico>
"hdx_pop2021"

#' Population by municipality of Mexico, ITER 2020
#'
#' Population of each municipality of Mexico by sex and age group, from the
#' territorial indicators (ITER, *Integración Territorial*) of the
#' 2020 Population and Housing Census of INEGI. Useful as denominators to calculate incidence
#' rates.
#'
#' @format A tibble with 2,469 rows (municipalities) and 44 columns. All
#'   population columns are numeric:
#' \describe{
#'   \item{CVEGEO}{five-digit municipality code of INEGI (state + municipality).}
#'   \item{pobtot}{total population.}
#'   \item{pobfem}{female population.}
#'   \item{pobmas}{male population.}
#'   \item{p_0a2}{population aged 0 to 2 years.}
#'   \item{p_0a2_f}{female population aged 0 to 2 years.}
#'   \item{p_0a2_m}{male population aged 0 to 2 years.}
#'   \item{p_3ymas}{population aged 3 years and over.}
#'   \item{p_3ymas_f}{female population aged 3 years and over.}
#'   \item{p_3ymas_m}{male population aged 3 years and over.}
#'   \item{p_5ymas}{population aged 5 years and over.}
#'   \item{p_5ymas_f}{female population aged 5 years and over.}
#'   \item{p_5ymas_m}{male population aged 5 years and over.}
#'   \item{p_12ymas}{population aged 12 years and over.}
#'   \item{p_12ymas_f}{female population aged 12 years and over.}
#'   \item{p_12ymas_m}{male population aged 12 years and over.}
#'   \item{p_15ymas}{population aged 15 years and over.}
#'   \item{p_15ymas_f}{female population aged 15 years and over.}
#'   \item{p_15ymas_m}{male population aged 15 years and over.}
#'   \item{p_18ymas}{population aged 18 years and over.}
#'   \item{p_18ymas_f}{female population aged 18 years and over.}
#'   \item{p_18ymas_m}{male population aged 18 years and over.}
#'   \item{p_3a5}{population aged 3 to 5 years.}
#'   \item{p_3a5_f}{female population aged 3 to 5 years.}
#'   \item{p_3a5_m}{male population aged 3 to 5 years.}
#'   \item{p_6a11}{population aged 6 to 11 years.}
#'   \item{p_6a11_f}{female population aged 6 to 11 years.}
#'   \item{p_6a11_m}{male population aged 6 to 11 years.}
#'   \item{p_8a14}{population aged 8 to 14 years.}
#'   \item{p_8a14_f}{female population aged 8 to 14 years.}
#'   \item{p_8a14_m}{male population aged 8 to 14 years.}
#'   \item{p_12a14}{population aged 12 to 14 years.}
#'   \item{p_12a14_f}{female population aged 12 to 14 years.}
#'   \item{p_12a14_m}{male population aged 12 to 14 years.}
#'   \item{p_15a17}{population aged 15 to 17 years.}
#'   \item{p_15a17_f}{female population aged 15 to 17 years.}
#'   \item{p_15a17_m}{male population aged 15 to 17 years.}
#'   \item{p_18a24}{population aged 18 to 24 years.}
#'   \item{p_18a24_f}{female population aged 18 to 24 years.}
#'   \item{p_18a24_m}{male population aged 18 to 24 years.}
#'   \item{p_15a49_f}{female population aged 15 to 49 years.}
#'   \item{p_60ymas}{population aged 60 years and over.}
#'   \item{p_60ymas_f}{female population aged 60 years and over.}
#'   \item{p_60ymas_m}{male population aged 60 years and over.}
#' }
#'
#' @source <https://www.inegi.org.mx/app/scitel/Default?ev=9>
"pop2020"

#' Population by municipality of Mexico, ITER 2010
#'
#' Population of each municipality of Mexico by sex and age group, from the
#' territorial indicators (ITER, *Integración Territorial*) of the
#' 2010 Population and Housing Census of INEGI. Useful as denominators to calculate incidence
#' rates.
#'
#' @format A tibble with 2,456 rows (municipalities) and 44 columns. All
#'   population columns are numeric:
#' \describe{
#'   \item{CVEGEO}{five-digit municipality code of INEGI (state + municipality).}
#'   \item{pobtot}{total population.}
#'   \item{pobfem}{female population.}
#'   \item{pobmas}{male population.}
#'   \item{p_0a2}{population aged 0 to 2 years.}
#'   \item{p_0a2_f}{female population aged 0 to 2 years.}
#'   \item{p_0a2_m}{male population aged 0 to 2 years.}
#'   \item{p_3ymas}{population aged 3 years and over.}
#'   \item{p_3ymas_f}{female population aged 3 years and over.}
#'   \item{p_3ymas_m}{male population aged 3 years and over.}
#'   \item{p_5ymas}{population aged 5 years and over.}
#'   \item{p_5ymas_f}{female population aged 5 years and over.}
#'   \item{p_5ymas_m}{male population aged 5 years and over.}
#'   \item{p_12ymas}{population aged 12 years and over.}
#'   \item{p_12ymas_f}{female population aged 12 years and over.}
#'   \item{p_12ymas_m}{male population aged 12 years and over.}
#'   \item{p_15ymas}{population aged 15 years and over.}
#'   \item{p_15ymas_f}{female population aged 15 years and over.}
#'   \item{p_15ymas_m}{male population aged 15 years and over.}
#'   \item{p_18ymas}{population aged 18 years and over.}
#'   \item{p_18ymas_f}{female population aged 18 years and over.}
#'   \item{p_18ymas_m}{male population aged 18 years and over.}
#'   \item{p_3a5}{population aged 3 to 5 years.}
#'   \item{p_3a5_f}{female population aged 3 to 5 years.}
#'   \item{p_3a5_m}{male population aged 3 to 5 years.}
#'   \item{p_6a11}{population aged 6 to 11 years.}
#'   \item{p_6a11_f}{female population aged 6 to 11 years.}
#'   \item{p_6a11_m}{male population aged 6 to 11 years.}
#'   \item{p_8a14}{population aged 8 to 14 years.}
#'   \item{p_8a14_f}{female population aged 8 to 14 years.}
#'   \item{p_8a14_m}{male population aged 8 to 14 years.}
#'   \item{p_12a14}{population aged 12 to 14 years.}
#'   \item{p_12a14_f}{female population aged 12 to 14 years.}
#'   \item{p_12a14_m}{male population aged 12 to 14 years.}
#'   \item{p_15a17}{population aged 15 to 17 years.}
#'   \item{p_15a17_f}{female population aged 15 to 17 years.}
#'   \item{p_15a17_m}{male population aged 15 to 17 years.}
#'   \item{p_18a24}{population aged 18 to 24 years.}
#'   \item{p_18a24_f}{female population aged 18 to 24 years.}
#'   \item{p_18a24_m}{male population aged 18 to 24 years.}
#'   \item{p_15a49_f}{female population aged 15 to 49 years.}
#'   \item{p_60ymas}{population aged 60 years and over.}
#'   \item{p_60ymas_f}{female population aged 60 years and over.}
#'   \item{p_60ymas_m}{male population aged 60 years and over.}
#' }
#'
#' @source <https://www.inegi.org.mx/app/scitel/Default?ev=9>
"pop2010"

#' Population by municipality of Mexico, ITER 2000
#'
#' Population of each municipality of Mexico by sex and age group, from the
#' territorial indicators (ITER, *Integración Territorial*) of the
#' 2000 Population and Housing Census of INEGI. Useful as denominators to calculate incidence
#' rates.
#'
#' @format A tibble with 2,443 rows (municipalities) and 4 columns. All
#'   population columns are numeric:
#' \describe{
#'   \item{CVEGEO}{five-digit municipality code of INEGI (state + municipality).}
#'   \item{pobtot}{total population.}
#'   \item{pobfem}{female population.}
#'   \item{pobmas}{male population.}
#' }
#'
#' @source <https://www.inegi.org.mx/app/scitel/Default?ev=9>
"pop2000"

#' Population of the municipalities of Mexico, 1990-2040 (CONAPO)
#'
#' Reconstruction (1990-2020) and projections (2021-2040) of the mid-year
#' population of the 2,475 municipalities of Mexico by sex and five-year age
#' group, published by the National Population Council (CONAPO).
#'
#' @format A tibble with 252,450 rows (municipality x sex x year) and 24
#'   columns:
#' \describe{
#'   \item{cvegeo}{five-digit municipality code of INEGI.}
#'   \item{nom_ent}{name of the state.}
#'   \item{nom_mun}{name of the municipality.}
#'   \item{sexo}{sex: `"HOMBRES"` (men) or `"MUJERES"` (women).}
#'   \item{ano}{year, 1990 to 2040.}
#'   \item{pob_00_04}{population aged 0 to 4 years.}
#'   \item{pob_05_09}{population aged 5 to 9 years.}
#'   \item{pob_10_14}{population aged 10 to 14 years.}
#'   \item{pob_15_19}{population aged 15 to 19 years.}
#'   \item{pob_20_24}{population aged 20 to 24 years.}
#'   \item{pob_25_29}{population aged 25 to 29 years.}
#'   \item{pob_30_34}{population aged 30 to 34 years.}
#'   \item{pob_35_39}{population aged 35 to 39 years.}
#'   \item{pob_40_44}{population aged 40 to 44 years.}
#'   \item{pob_45_49}{population aged 45 to 49 years.}
#'   \item{pob_50_54}{population aged 50 to 54 years.}
#'   \item{pob_55_59}{population aged 55 to 59 years.}
#'   \item{pob_60_64}{population aged 60 to 64 years.}
#'   \item{pob_65_69}{population aged 65 to 69 years.}
#'   \item{pob_70_74}{population aged 70 to 74 years.}
#'   \item{pob_75_79}{population aged 75 to 79 years.}
#'   \item{pob_80_84}{population aged 80 to 84 years.}
#'   \item{pob_85_mm}{population aged 85 years and over.}
#'   \item{pob_total}{total population.}
#' }
#'
#' @source <https://www.gob.mx/conapo/documentos/reconstruccion-y-proyecciones-de-la-poblacion-de-los-municipios-de-mexico-1990-2040>
"conapop"
