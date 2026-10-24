# popmex

[English](https://fdzul.github.io/popmex/README.md) · **Español**

[![R-universe](https://fdzul.r-universe.dev/badges/popmex)](https://fdzul.r-universe.dev/popmex)
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![License:
MIT](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/fdzul/popmex/blob/main/LICENSE.md)

## Descripción general

popmex ofrece bases de datos de población de México a nivel municipal y
en hexágonos de 400 m, para calcular tasas de incidencia y mapear dónde
vive la población en las localidades urbanas.

La población es el denominador de toda tasa y la exposición de todo
modelo espacial. popmex reúne en un solo lugar la población censal por
municipio, sexo y grupo de edad (INEGI 2000, 2010 y 2020), las
reconstrucciones y proyecciones de CONAPO 1990-2040 la población en
hexágonos H3 de 400 m (Kontur 2021-2023) para trabajar al interior de
las ciudades, y el raster de población LandScan Global (1 km), que se
descarga cuando se necesita con
[`get_landscan()`](https://fdzul.github.io/popmex/reference/get_landscan.md).

popmex forma parte del [**dengueverse**](https://fdzul.r-universe.dev),
una familia de paquetes de R para la vigilancia, el análisis espacial y
el control del dengue y otras enfermedades transmitidas por *Aedes* en
México.

## Bases de datos

| Base de datos | Descripción | Fuente |
|:---|:---|:---|
| [`conapop`](https://fdzul.github.io/popmex/reference/conapop.html) | Population of the municipalities of Mexico, 1990-2040 (CONAPO) | [link](https://www.gob.mx/conapo/documentos/reconstruccion-y-proyecciones-de-la-poblacion-de-los-municipios-de-mexico-1990-2040) |
| [`hdx_pop2021`](https://fdzul.github.io/popmex/reference/hdx_pop2021.html) | Population in 400 m H3 hexagons of Mexico, 2021 (Kontur / HDX) | [link](https://data.humdata.org/dataset/kontur-population-mexico) |
| [`hdx_pop2022`](https://fdzul.github.io/popmex/reference/hdx_pop2022.html) | Population in 400 m H3 hexagons of Mexico, 2022 (Kontur / HDX) | [link](https://data.humdata.org/dataset/kontur-population-mexico) |
| [`hdx_pop2023`](https://fdzul.github.io/popmex/reference/hdx_pop2023.html) | Population in 400 m H3 hexagons of Mexico, 2023 (Kontur / HDX) | [link](https://data.humdata.org/dataset/kontur-population-mexico) |
| [`pop2000`](https://fdzul.github.io/popmex/reference/pop2000.html) | Population by municipality of Mexico, ITER 2000 | [link](https://www.inegi.org.mx/app/scitel/Default?ev=9) |
| [`pop2010`](https://fdzul.github.io/popmex/reference/pop2010.html) | Population by municipality of Mexico, ITER 2010 | [link](https://www.inegi.org.mx/app/scitel/Default?ev=9) |
| [`pop2020`](https://fdzul.github.io/popmex/reference/pop2020.html) | Population by municipality of Mexico, ITER 2020 | [link](https://www.inegi.org.mx/app/scitel/Default?ev=9) |

Consulta la descripción completa de cada base con `?nombre`.

## Funciones principales

| Función | Descripción |
|:---|:---|
| [`extract_pop()`](https://fdzul.github.io/popmex/reference/extract_pop.html) | Extract the population of a locality in 400 m H3 hexagons |
| [`get_landscan()`](https://fdzul.github.io/popmex/reference/get_landscan.html) | Download the LandScan population raster of Mexico |

## Instalación

Instala la versión publicada desde el [R-universe del
dengueverse](https://fdzul.r-universe.dev):

``` r

install.packages("popmex",
                 repos = c("https://fdzul.r-universe.dev",
                           "https://cloud.r-project.org"))
```

O la versión en desarrollo desde
[GitHub](https://github.com/fdzul/popmex):

``` r

# install.packages("pak")
pak::pak("fdzul/popmex")
```

## Ejemplo

``` r

library(popmex)

# población en hexágonos de 400 m de la zona metropolitana de Mérida, 2023
merida <- extract_pop(year = 2023, cve_edo = "31",
                      locality = c("Merida", "Uman", "Kanasin"))
sum(merida$population)

# población censal de cada municipio en 2020 (denominador de tasas)
head(pop2020[, c("CVEGEO", "pobtot", "pobfem", "pobmas")])
```

Hay ejemplos más completos en los
[artículos](https://fdzul.github.io/popmex/articles/) del sitio web.

## Fuentes de datos

- **Kontur Population** (`hdx_pop2021`, `hdx_pop2022`, `hdx_pop2023`),
  publicada en el [Humanitarian Data
  Exchange](https://data.humdata.org/dataset/kontur-population-mexico).
  Licencia: CC BY 4.0.
- **ITER, Censos de Población y Vivienda 2000, 2010 y 2020** (`pop2000`,
  `pop2010`, `pop2020`),
  [INEGI](https://www.inegi.org.mx/app/scitel/Default?ev=9). Columnas de
  población convertidas a numéricas; totales verificados contra INEGI.
- **LandScan Global**
  ([`get_landscan()`](https://fdzul.github.io/popmex/reference/get_landscan.md)),
  [Oak Ridge National Laboratory](https://landscan.ornl.gov), resolución
  de 1 km. Licencia: CC BY 4.0. El raster no se instala con el paquete:
  está publicado como archivo del [release
  `landscan-data`](https://github.com/fdzul/popmex/releases/tag/landscan-data)
  y se descarga, una sola vez, la primera vez que se llama a
  [`get_landscan()`](https://fdzul.github.io/popmex/reference/get_landscan.md).
  Cita la edición de LandScan que uses (p. ej. Sims K, et al. (2023).
  *LandScan Global 2022* \[Data set\]. Oak Ridge National Laboratory.
  <https://doi.org/10.48690/1529167>).
- **Reconstrucción y proyecciones de la población de los municipios de
  México 1990-2040** (`conapop`),
  [CONAPO](https://www.gob.mx/conapo/documentos/reconstruccion-y-proyecciones-de-la-poblacion-de-los-municipios-de-mexico-1990-2040).

Los scripts de procesamiento están en
[`data-raw/`](https://github.com/fdzul/popmex/tree/main/data-raw).

## Cómo citar

Si usas popmex en una publicación, por favor cítalo:

``` R
Dzul Manzanilla F, Correa-Morales F, Cruz López C, Morales García E
(2026). _popmex: Population Datasets of Mexico at Municipal and Hexagon
Resolution_. R package version 0.2.0,
<https://fdzul.r-universe.dev/popmex>.
```

## Autores y colaboradores

- Felipe Antonio Dzul Manzanilla
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--2085--9141-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-2085-9141)
  (autor, mantenedor)
- Fabián Correa-Morales
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--6193--1242-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-6193-1242)
  (autor)
- Cecilia Cruz López
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--9156--5669-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-9156-5669)
  (autor)
- Emmanuel Morales García
  [![ORCID](https://img.shields.io/badge/ORCID-0000--0002--6837--9227-A6CE39?logo=orcid&logoColor=white)](https://orcid.org/0000-0002-6837-9227)
  (autor)

## Agradecimientos

Este trabajo se desarrolló en el Instituto Nacional de Salud Pública
(INSP), México, en colaboración con el Centro Nacional de Programas
Preventivos y Control de Enfermedades (CENAPRECE) de la Secretaría de
Salud.

## Motivación

popmex nace de la necesidad de apoyar la toma de decisiones basada en
evidencia en el programa de Enfermedades Transmitidas por Vector (ETV)
del CENAPRECE de la Secretaría de Salud de México.

## Ayuda

- Errores y sugerencias: abre un
  [issue](https://github.com/fdzul/popmex/issues) con un ejemplo mínimo
  reproducible ([reprex](https://reprex.tidyverse.org)).
- Preguntas: <felipe.dzul.m@gmail.com>

## Aviso

Las bases de datos de popmex provienen de fuentes públicas y se ofrecen
con fines de investigación y salud pública. No son un producto oficial
de las instituciones de origen; consulta las fuentes originales para las
cifras oficiales.

## Licencia

MIT © 2026 Felipe Antonio Dzul Manzanilla. Ver
[LICENSE.md](https://fdzul.github.io/popmex/LICENSE.md).

Este proyecto se publica con un [Código de Conducta para
colaboradores](https://www.contributor-covenant.org/es/version/2/1/code_of_conduct/).
Al participar en este proyecto aceptas cumplir sus términos.
