# R script to install requirements for exercises -------------------------------

## global variables (edit in this section) -------------------------------------
pkgs <- c("reticulate", "SummarizedExperiment", "SingleCellExperiment","igraph","BiocNeighbors",
          "keras", "tensorflow", "Matrix", "Rtsne", "rsvd", "RColorBrewer","dplyr","reshape2",
          "gridextra", "umap", "tibble", "ggplot2", "cowplot","scater","scran","swissknife","batchelor",
          "knitr", "rmarkdown", "htmltools", "BiocStyle","BiocSingular", "shiny","tidyr","BiocParallel",
          "ComplexHeatmap","tximeta","GenomicFeatures","AnnotationDbi","org.Mm.eg.db","rtracklayer")





## install Bioconductor --------------------------------------------------------
biocversion <- "3.14"
if (!require("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

if (!identical(as.character(BiocManager::version()), biocversion)) {
    BiocManager::install(version = biocversion)
}

## install and check package loading -------------------------------------------
for (pkg in basename(pkgs)) {
    BiocManager::install(pkg, ask = FALSE, update = FALSE);

    if (! library(pkg, character.only = TRUE, logical.return = TRUE)) {
        write(paste0("Installation of package ",
                     p,
                     " exited with non-zero exit status"),
                     stdout())
        quit(status = 1, save = "no")
    }
}

sessionInfo()
