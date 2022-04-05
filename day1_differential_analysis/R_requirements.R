# R script to install requirements for exercises -------------------------------

## global variables (edit in this section) -------------------------------------
pkgs <- c("miloR","muscat","devtools", "distinct",
          "condiments", "nebula", "sechm", "dynverse/dyntoy",
          "fionarhuang/treeclimbR")


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
for (pkg in basename(pkgs))
    library(pkg, character.only = TRUE)


sessionInfo()
