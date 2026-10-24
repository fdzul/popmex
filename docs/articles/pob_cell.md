# Extract and Visualize the Population of Mexico (LandScan)

``` r

library(terra)
library(tidyterra)
library(popmex)
```

In the official homepage of [LandScan](https://landscan.ornl.gov), is
defined as a globally recognized, R&D100-winning population data
platform developed at Oak Ridge National Laboratory (ORNL). Its datasets
provide human population distribution estimates down to 100 meter grid
resolution. LandScan supports disaster response, humanitarian aid,
environmental analysis, and urban planning by providing insights into
where people live and how they move.

### Load the layers

``` r

lyrs <- popmex::get_landscan()
names(lyrs)
#>  [1] "pop_2000" "pop_2001" "pop_2002" "pop_2003" "pop_2004" "pop_2005"
#>  [7] "pop_2006" "pop_2007" "pop_2008" "pop_2009" "pop_2010" "pop_2011"
#> [13] "pop_2012" "pop_2013" "pop_2014" "pop_2015" "pop_2016" "pop_2017"
#> [19] "pop_2018" "pop_2019" "pop_2020" "pop_2021" "pop_2022" "pop_2023"
#> [25] "pop_2024" "pop_2026"
```

### Plot the layer

``` r

pop2026 <- lyrs |>
    dplyr::select(pop_2026)
mapgl::maplibre(palette = viridis::viridis,
                bounds = sf::st_bbox(rgeomex::AGEM_inegi19_mx)) |>
    mapgl::add_image_source(id = "pop-2026",
                            data = pop2026) |>
    mapgl::add_raster_layer(id = "raster",
                            source = "pop-2026") |>
    # Configuración correcta para datos continuos
    mapgl::add_legend(legend_title = "Población 2026",
                      values = c(0, 1000, 5000, 10000, 30000, 46919),            
                      colors = viridis::viridis(n = 10), 
                      type = "continuous",                       
                      position = "bottom-left") |>
    mapgl::add_navigation_control() |>
    mapgl::add_globe_control() |>
    mapgl::add_scale_control()
```
