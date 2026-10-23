
<!-- README.md is generated from README.Rmd. Please edit that file -->

**English** · [Español](README.es.md)

# popmex <img src="man/figures/logo.png" align="right" height="139" alt="" />

<!-- badges: start -->

[![R-universe](https://fdzul.r-universe.dev/badges/popmex)](https://fdzul.r-universe.dev/popmex)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/fdzul/popmex/blob/main/LICENSE.md)
<!-- badges: end -->

## Overview

popmex provides population datasets of Mexico at municipal and hexagon
(400 m) resolution, to calculate incidence rates and to map where people
live in urban localities.

Population is the denominator of every rate and the exposure of every
spatial model. popmex gathers in one place the census population by
municipality, sex and age group (INEGI 2000, 2010 and 2020), the CONAPO
reconstructions and projections for 1990-2040, and the population in 400
m H3 hexagons (Kontur 2021-2023) to work inside cities.

popmex is part of the [**dengueverse**](https://fdzul.r-universe.dev), a
family of R packages for the surveillance, spatial analysis and control
of dengue and other *Aedes*-borne diseases in Mexico.

## Datasets

| Dataset | Description | Source |
|:---|:---|:---|
| [`conapop`](https://fdzul.github.io/popmex/reference/conapop.html) | Population of the municipalities of Mexico, 1990-2040 (CONAPO) | [link](https://www.gob.mx/conapo/documentos/reconstruccion-y-proyecciones-de-la-poblacion-de-los-municipios-de-mexico-1990-2040) |
| [`hdx_pop2021`](https://fdzul.github.io/popmex/reference/hdx_pop2021.html) | Population in 400 m H3 hexagons of Mexico, 2021 (Kontur / HDX) | [link](https://data.humdata.org/dataset/kontur-population-mexico) |
| [`hdx_pop2022`](https://fdzul.github.io/popmex/reference/hdx_pop2022.html) | Population in 400 m H3 hexagons of Mexico, 2022 (Kontur / HDX) | [link](https://data.humdata.org/dataset/kontur-population-mexico) |
| [`hdx_pop2023`](https://fdzul.github.io/popmex/reference/hdx_pop2023.html) | Population in 400 m H3 hexagons of Mexico, 2023 (Kontur / HDX) | [link](https://data.humdata.org/dataset/kontur-population-mexico) |
| [`pop2000`](https://fdzul.github.io/popmex/reference/pop2000.html) | Population by municipality of Mexico, ITER 2000 | [link](https://www.inegi.org.mx/app/scitel/Default?ev=9) |
| [`pop2010`](https://fdzul.github.io/popmex/reference/pop2010.html) | Population by municipality of Mexico, ITER 2010 | [link](https://www.inegi.org.mx/app/scitel/Default?ev=9) |
| [`pop2020`](https://fdzul.github.io/popmex/reference/pop2020.html) | Population by municipality of Mexico, ITER 2020 | [link](https://www.inegi.org.mx/app/scitel/Default?ev=9) |

See the full description of each dataset with `?name`.

## Main functions

| Function | Description |
|:---|:---|
| [`extract_pop()`](https://fdzul.github.io/popmex/reference/extract_pop.html) | Extract the population of a locality in 400 m H3 hexagons |

## Installation

Install the released version from the [dengueverse
R-universe](https://fdzul.r-universe.dev):

``` r
install.packages("popmex",
                 repos = c("https://fdzul.r-universe.dev",
                           "https://cloud.r-project.org"))
```

Or the development version from
[GitHub](https://github.com/fdzul/popmex):

``` r
# install.packages("pak")
pak::pak("fdzul/popmex")
```

## Example

``` r
library(popmex)

# population in 400 m hexagons of the metropolitan area of Mérida, 2023
merida <- extract_pop(year = 2023, cve_edo = "31",
                      locality = c("Merida", "Uman", "Kanasin"))
sum(merida$population)

# census population of each municipality in 2020 (denominator of rates)
head(pop2020[, c("CVEGEO", "pobtot", "pobfem", "pobmas")])
```

Longer examples are in the
[articles](https://fdzul.github.io/popmex/articles/) of the website.

## Data sources

- **Kontur Population** (`hdx_pop2021`, `hdx_pop2022`, `hdx_pop2023`),
  published in the [Humanitarian Data
  Exchange](https://data.humdata.org/dataset/kontur-population-mexico).
  License: CC BY 4.0.
- **ITER, Censos de Población y Vivienda 2000, 2010 y 2020** (`pop2000`,
  `pop2010`, `pop2020`),
  [INEGI](https://www.inegi.org.mx/app/scitel/Default?ev=9). Population
  columns converted to numeric; totals checked against INEGI.
- **Reconstrucción y proyecciones de la población de los municipios de
  México 1990-2040** (`conapop`),
  [CONAPO](https://www.gob.mx/conapo/documentos/reconstruccion-y-proyecciones-de-la-poblacion-de-los-municipios-de-mexico-1990-2040).

Processing scripts are in
[`data-raw/`](https://github.com/fdzul/popmex/tree/main/data-raw).

## How to cite

If you use popmex in a publication, please cite it:

    Warning in person1(given = given[[i]], family = family[[i]], middle = middle[[i]], :
    Invalid ORCID iD: '//orcid.org/0000-0002-9156-5669'.
    Dzul Manzanilla F, Cruz López C, Morales García E (2026). _popmex: Population
    Density Mexico_. R package version 0.1.0, commit
    5987a7efc6941ba5bf3114f7f55cf3c6326fdd6c, <https://github.com/fdzul/popmex>.

## Authors and contributors

- Felipe Antonio Dzul Manzanilla
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--2085--9141-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-2085-9141)
  (author, maintainer)
- Cecilia Cruz López
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--9156--5669-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-9156-5669)
  (author)
- Emmanuel Morales García
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--6837--9227-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-6837-9227)
  (author)
- Fabian Correa-Morales
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--6193--1242-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-6193-1242)
  (contributor)

## Acknowledgements

This work was developed at the Instituto Nacional de Salud Pública
(INSP), Mexico, in collaboration with the Centro Nacional de Programas
Preventivos y Control de Enfermedades (CENAPRECE) of the Secretaría de
Salud.

## Motivation

popmex was born from the need to support evidence-based decisions in the
Vector-Borne Diseases (VBD) program of CENAPRECE of the Secretaría de
Salud of Mexico.

## Getting help

- Bugs and feature requests: open an
  [issue](https://github.com/fdzul/popmex/issues) with a minimal
  reproducible example ([reprex](https://reprex.tidyverse.org)).
- Questions: <felipe.dzul.m@gmail.com>

## Disclaimer

The datasets in popmex are derived from public sources and are provided
for research and public-health purposes. They are not an official
product of the original institutions; please check the original sources
for official figures.

## License

MIT © 2026 Felipe Antonio Dzul Manzanilla. See [LICENSE.md](LICENSE.md).

Please note that this project is released with a [Contributor Code of
Conduct](https://contributor-covenant.org/version/2/1/CODE_OF_CONDUCT.html).
By participating in this project you agree to abide by its terms.
