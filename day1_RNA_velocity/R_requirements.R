# R script to install requirements for exercises -------------------------------

## global variables (edit in this section) -------------------------------------
pkgs <- c("velociraptor", "SummarizedExperiment", "SingleCellExperiment", 
          "tximeta", "eisaR", "fishpond", "basilisk", "Biostrings", "BSgenome",
          "GenomicFeatures", "rjson", "scRNAseq", "zellkonverter", "cowplot",
          "knitr", "rmarkdown", "htmltools", "BiocStyle", "shiny", "dplyr",
          "ggplot2", "tidyr", "reticulate", "scuttle", "scran", "scater",
          "veloviz")


## install Bioconductor --------------------------------------------------------
biocversion <- "3.14"
if (!require("BiocManager", quietly = TRUE)) {
    install.packages("BiocManager")
}

if (!identical(as.character(BiocManager::version()), biocversion)) {
    BiocManager::install(version = biocversion)
}


## install additional packages -------------------------------------------------
BiocManager::install(pkgs, update = FALSE)


## check package loading -------------------------------------------------------
for (pkg in pkgs)
    library(pkg, character.only = TRUE)


sessionInfo()
