# R script to install requirements for exercises -------------------------------

## global variables (edit in this section) -------------------------------------
pkgs <- c("SummarizedExperiment", "SingleCellExperiment",
          "TENxPBMCData", "iSEE", "iSEEu", "scater", "scuttle", "scran",
          "BiocSingular", "SingleR", "celldex", "igraph", "knitr", "rmarkdown",
          "htmltools", "BiocStyle", "shiny")


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
