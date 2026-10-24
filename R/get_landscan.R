#' Download the LandScan population raster of Mexico
#'
#' Downloads (only the first time) the LandScan population raster of Mexico
#' published as an asset of a GitHub release of popmex, and returns it as a
#' `SpatRaster`. The file is kept in a local cache, so later calls read it
#' from disk without downloading it again.
#'
#' @param url address of the file. By default, the asset `pop_LandScan.tif`
#'   of the release `landscan-data` of the popmex repository.
#' @param refresh if `TRUE`, download the file again even if it is cached.
#'
#' @return a `terra::SpatRaster` with the estimated population per cell.
#' @export
#'
#' @author Felipe Antonio Dzul Manzanilla \email{felipe.dzul.m@gmail.com}.
#'
#' @source LandScan Global, Oak Ridge National Laboratory (ORNL),
#'   <https://landscan.ornl.gov>.
#'
#' @examples
#' \donttest{
#' if (requireNamespace("terra", quietly = TRUE)) {
#'   r <- get_landscan()
#'   r
#' }
#' }
get_landscan <- function(
        url = "https://github.com/fdzul/popmex/releases/download/landscan-data/pop_LandScan.tif",
        refresh = FALSE) {

    if (!requireNamespace("terra", quietly = TRUE)) {
        stop("Package 'terra' is needed for get_landscan(). ",
             "Install it with install.packages('terra').", call. = FALSE)
    }

    cache <- tools::R_user_dir("popmex", which = "cache")
    dir.create(cache, recursive = TRUE, showWarnings = FALSE)
    path <- file.path(cache, basename(url))

    if (refresh || !file.exists(path)) {
        message("Downloading LandScan raster (about 39 MB), only the first time...")
        old <- options(timeout = max(600, getOption("timeout")))
        on.exit(options(old), add = TRUE)
        ok <- tryCatch(utils::download.file(url, path, mode = "wb", quiet = TRUE),
                       error = function(e) 1L)
        if (!identical(ok, 0L) || !file.exists(path)) {
            unlink(path)
            stop("Could not download ", url, call. = FALSE)
        }
    }

    terra::rast(path)
}
