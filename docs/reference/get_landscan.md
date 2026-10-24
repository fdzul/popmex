# Download the LandScan population raster of Mexico

Downloads (only the first time) the LandScan population raster of Mexico
published as an asset of a GitHub release of popmex, and returns it as a
\`SpatRaster\`. The file is kept in a local cache, so later calls read
it from disk without downloading it again.

## Usage

``` r
get_landscan(
  url =
    "https://github.com/fdzul/popmex/releases/download/landscan-data/pop_LandScan.tif",
  refresh = FALSE
)
```

## Source

LandScan Global, Oak Ridge National Laboratory (ORNL),
\<https://landscan.ornl.gov\>.

## Arguments

- url:

  address of the file. By default, the asset \`pop_LandScan.tif\` of the
  release \`landscan-data\` of the popmex repository.

- refresh:

  if \`TRUE\`, download the file again even if it is cached.

## Value

a \`terra::SpatRaster\` with the estimated population per cell.

## Author

Felipe Antonio Dzul Manzanilla <felipe.dzul.m@gmail.com>.

## Examples

``` r
# \donttest{
if (requireNamespace("terra", quietly = TRUE)) {
  r <- get_landscan()
  r
}
#> class       : SpatRaster
#> size        : 2182, 3799, 26  (nrow, ncol, nlyr)
#> resolution  : 0.008333333, 0.008333333  (x, y)
#> extent      : -118.3667, -86.70833, 14.53333, 32.71667  (xmin, xmax, ymin, ymax)
#> coord. ref. : lon/lat WGS 84 (EPSG:4326)
#> source      : pop_LandScan.tif
#> names       : pop_2000, pop_2001, pop_2002, pop_2003, pop_2004, pop_2005, ...
#> min values  :        0,        0,        0,        0,        0,        0, ...
#> max values  :    73503,    60288,    71586,    58516,    59216,    60214, ...
# }
```
