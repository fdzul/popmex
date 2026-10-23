# popmex 0.2.0 — limpieza de los datos incluidos en el paquete.
# Se ejecuta una vez desde la raíz del paquete:  Rscript data-raw/fix_types_and_compress.R
#
# 1. pop2000, pop2010 y pop2020: las columnas de población venían como texto
#    (character). Todas son conteos y se convierten a numérico. Se verifica
#    antes que ningún valor se pierda en la conversión.
# 2. Se quitan clases residuales de readr (spec_tbl_df) y se dejan tibbles.
# 3. Todos los archivos se guardan con compresión xz (≈ -27 % de tamaño).

fix_census <- function(x) {
    id <- names(x)[1]                       # CVEGEO
    num <- setdiff(names(x), id)
    for (col in num) {
        v <- x[[col]]
        if (is.character(v)) {
            out <- suppressWarnings(as.numeric(v))
            lost <- sum(is.na(out) & !is.na(v))
            if (lost > 0) stop(col, ": ", lost, " valores no numéricos")
            x[[col]] <- out
        }
    }
    attr(x, "spec") <- NULL
    attr(x, "problems") <- NULL
    class(x) <- c("tbl_df", "tbl", "data.frame")
    x
}

for (n in c("pop2000", "pop2010", "pop2020")) {
    f <- file.path("data", paste0(n, ".rda"))
    e <- new.env()
    load(f, envir = e)
    assign(n, fix_census(e[[n]]))
    save(list = n, file = f, compress = "xz", compression_level = 9)
}

tools::resaveRdaFiles("data", compress = "xz", compression_level = 9)
print(tools::checkRdaFiles("data"))
