# Extract and Visualize the Population of an State

``` r

library(popmex)
```

This tutorial demonstrates how to extract population data at the
municipality level, using census data from INEGI (2000, 2010, and 2020)
as well as population estimates and projections from CONAPO.

## INEGI

#### Population 2000

Table

``` r

gtExtras::gt_plt_summary(popmex::pop2000, title = "Total population from the 2000 Census")
```

[TABLE]

Map

``` r

library(sf)
#> Warning: package 'sf' was built under R version 4.6.1
#> Linking to GEOS 3.13.0, GDAL 3.8.5, PROJ 9.5.1; sf_use_s2() is TRUE
# Step 1. extract the dataset ####
pop2000 <- popmex::pop2000 |>
    dplyr::select(CVEGEO, pobtot) 



# Step 2. Incorporate total population into the geographic information ####
pop2000 <- dplyr::left_join(x = rgeomex::AGEM_inegi19_mx, 
                            y = pop2000,
                            by = "CVEGEO") |>
    dplyr::select(-NOMGEO) |>
  dplyr::filter(CVE_ENT == "16")



# Step 3. create the automatic continuous scale with equal breaks ####
continuous_scale <- mapgl::interpolate_palette(data = pop2000 ,
                                               column = "pobtot",
                                               method = "equal",
                                               n =5,
                                               palette = viridisLite::plasma)



# Step 4. visualization #####
mapgl::maplibre(style  = mapgl::carto_style("positron"),
                bounds = sf::st_bbox(pop2000)) |>
    mapgl::add_source("mpo", data = pop2000) |>
    mapgl::add_line_layer(id = "mpo-borde",
                          source     = "mpo",
                          line_color = "white",
                          line_width = 0.5) |>
    mapgl::add_fill_layer(id = "mpo_mex",
                          source = "mpo",
                          fill_outline_color = "white",
                          fill_color = continuous_scale$expression,
                          fill_opacity = 0.8) |>
    mapgl::add_legend("Population 2000",
                      values = mapgl::get_legend_labels(continuous_scale, 
                                                        digits = 0),
                      colors = mapgl::get_legend_colors(continuous_scale),
                      type = "continuous",
                      position = "bottom-left",
                      draggable = TRUE,
                      collapsible = FALSE,
                      collapsed = TRUE) |>
    mapgl::add_fullscreen_control(position = "top-left") |> 
    mapgl::add_navigation_control() |>
    mapgl::add_globe_control() |>
    mapgl::add_scale_control()
```

#### Population 2010

``` r

gtExtras::gt_plt_summary(popmex::pop2010, title = "Total population from the 2010 Census")
```

[TABLE]

#### Population 2020

``` r

gtExtras::gt_plt_summary(popmex::pop2020, title = "Total population from the 2020 Census")
```

[TABLE]

## CONAPO

``` r

gtExtras::gt_plt_summary(popmex::conapop, title = "Total population from CONAPO")
#> Warning: Data has more than 100,000 rows, consider sampling the data to reduce
#> size.
```

[TABLE]

``` r

library(sf)
# Step 1. extract the dataset ####
pop25 <- popmex::conapop |>
    dplyr::select(cvegeo, ano, sexo, pob_total) |>
    dplyr::group_by(cvegeo, ano) |>
    dplyr::summarise(pop = sum(pob_total), .groups = "drop") |>
    dplyr::filter(ano == 2025)

# Step 2. Incorporate total population into the geographic information ####
pop2025 <- dplyr::left_join(x = rgeomex::AGEM_inegi19_mx, 
                            y = pop25,
                            by = c("CVEGEO" = "cvegeo")) |>
    dplyr::select(-NOMGEO) |>
  dplyr::filter(CVE_ENT == "16")



# Step 3. create the automatic continuous scale with equal breaks ####
continuous_scale <- mapgl::interpolate_palette(data = pop2025,
                                               column = "pop",
                                               method = "equal",
                                               n =5,
                                               palette = viridisLite::plasma)


# Step 4. visualization #####
mapgl::maplibre(style  = mapgl::carto_style("positron"),
                bounds = sf::st_bbox(pop2025)) |>
    mapgl::add_source("mpo", data = pop2025) |>
    mapgl::add_line_layer(id = "mpo-borde",
                          source     = "mpo",
                          line_color = "white",
                          line_width = 0.5) |>
    mapgl::add_fill_layer(id = "mpo_mex",
                          source = "mpo",
                          fill_outline_color = "white",
                          fill_color = continuous_scale$expression,
                          fill_opacity = 0.8) |>
    mapgl::add_legend("Population 2025",
                      values = mapgl::get_legend_labels(continuous_scale, 
                                                        digits = 0),
                      colors = mapgl::get_legend_colors(continuous_scale),
                      type = "continuous",
                      position = "bottom-left",
                      draggable = TRUE,
                      collapsible = FALSE,
                      collapsed = TRUE) |>
    mapgl::add_fullscreen_control(position = "top-left") |> 
    mapgl::add_navigation_control() |>
    mapgl::add_globe_control() |>
    mapgl::add_scale_control()
```
