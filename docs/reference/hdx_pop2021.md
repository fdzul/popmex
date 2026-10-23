# Population in 400 m H3 hexagons of Mexico, 2021 (Kontur / HDX)

Estimated number of inhabitants in each H3 hexagon of resolution 8
(about 400 m across) of Mexico, from the Kontur Population dataset
published in the Humanitarian Data Exchange (HDX). Only hexagons with
population are included. This edition has no \`h3\` column.

## Usage

``` r
hdx_pop2021
```

## Format

An \`sf\` data frame (EPSG:4326, MULTIPOLYGON geometries) with 362,028
rows:

- population:

  estimated number of inhabitants in the hexagon.

- geom:

  hexagon geometry.

## Source

\<https://data.humdata.org/dataset/kontur-population-mexico\>

## See also

\[extract_pop()\] to extract the hexagons of a locality.
