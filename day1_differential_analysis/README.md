# Differential analysis

This session will cover differential abundance (DA) analysis (i.e. differences 
in the prevalence of certain cell types across conditions) and differential 
state (DS) analysis (i.e. differences in gene expression between cells of the 
same cell type across conditions).
This will first be done for cluster-based datasets, and then for datasets with
more continuous cell states.

## Cluster-based 

As main example for this part, we will use a dataset of 4 vs 4 scRNAseq samples 
of the mouse cortex exposed to LPS (an endotoxin mimicking the inflammatory 
response to pathogens) or to a vehicle control.

The data was published in [Crowell et al., 2020](https://doi.org/10.1038/s41467-020-19894-4),
and we will use the data (clustering & annotation) from that analysis (with some
extra simplification). The code for this analysis is available
[here](http://htmlpreview.github.io/?https://github.com/HelenaLC/muscat-comparison/blob/master/LPS/docs/index.html).
Another example pipeline for these steps is available 
[here](https://github.com/sta426hs2021/material/blob/main/week13-13dec2021/workflow.Rmd).

* Differential abundance (DA) analysis
  - [Demonstration](DA_clusterBased_demo.Rmd)
  - [Exercise](DA_exercise.Rmd)
* Differential state (DS) analysis
  - [Demonstration](DS_clusterBased_demo.Rmd)
  - [Exercise](DS_exercise.Rmd)

## Continuous/trajectory datasets

For simplicity, this part will rely on a simulated dataset.

* Differential abundance (DA) analysis
  - [Demonstration](DA_continuum_demo.Rmd)
  - [Exercise](DA_continuum_exercise.Rmd)
