## Contents

- `1_multiomics_preprocess_omics.ipynb` - workflow for pre-processing and exploratory data analysis of RNA and ATAC data modalities
- `2_multiomics_joint.ipynb` - workflow for joint dimensionality reduction of multi-omics data  
- `3_multiomics_peak2gene_association.ipynb` - workflow for feature-wise analysis

## Data

Here we will be using human fetal brain cortex data from [Trevino et al. 2021](https://www.cell.com/cell/fulltext/S0092-8674(21)00942-9?_returnURL=https%3A%2F%2Flinkinghub.elsevier.com%2Fretrieve%2Fpii%2FS0092867421009429%3Fshowall%3Dtrue) ([source](https://github.com/GreenleafLab/brainchromatin)) ([OA preprint](https://www.biorxiv.org/content/10.1101/2020.12.29.424636v2.full)) to study the interplay between chromatin accessibility and gene expression in early corticogenesis. Corticogenesis is the dynamic process that results in the formation of the cerebral cortex, and is characterized by the generation of excitatory glutamatergic neurons from cortical progenitors, and the differentiation of astrocytes and oligodendrocytes. 

Specifically, we will be using the data generated using the 10X genomics Multiome protocol, for joint profiling of chromatin accessibility and gene expression on the same cells.

- **scRNA-seq data** 
    - `Trevino_multiome_RNA_clean.h5ad` - AnnData object storing raw counts over genes (before filtering and processing)
    - `Trevino_multiome_RNA_clean.preprocessed.h5ad` - AnnData object storing preprocessed gene expression profiles and dimensionality reductions (output to `1_multiomics_preprocess_omics.ipynb`)

- **scATAC-seq data** 
    - `Trevino_multiome_ATAC_clean.h5ad` - AnnData object storing raw counts over peaks (before filtering and processing)
    - `Trevino_multiome_ATAC_clean.preprocessed.h5ad` - AnnData object storing preprocessed accessibility profiles, dimensionality reductions, gene activities (output to `1_multiomics_preprocess_omics.ipynb`)
    - `Trevino_multiome_ATAC_clean.peaks_bias.bed` - BED file storing peak genomic locations and GC bias (calculated using `chromVAR::addGCBias`)
    
- **multi-modal objects**
    - *vertical_clean_embeddings.h5mu* - MuData object storing results from joint-dimensionality reduction on both modalities (output to `2_multiomics_joint.ipynb`)

