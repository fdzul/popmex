# Population in 400 m H3 hexagons of Mexico, 2022 (Kontur / HDX)

Estimated number of inhabitants in each H3 hexagon of resolution 8
(about 400 m across) of Mexico, from the Kontur Population dataset
published in the Humanitarian Data Exchange (HDX). Only hexagons with
population are included.

## Usage

``` r
hdx_pop2022
```

## Format

An \`sf\` data frame (EPSG:4326, POLYGON geometries) with 463,830 rows:

- h3:

  H3 index of the hexagon (resolution 8).

- population:

  estimated number of inhabitants in the hexagon.

- geom:

  hexagon geometry.

## Source

\<https://data.humdata.org/dataset/kontur-population-mexico\>

## See also

\[extract_pop()\] to extract the hexagons of a locality.
