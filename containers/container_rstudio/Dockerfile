FROM rocker/rstudio:4.1.2

RUN sudo apt-get update

RUN sudo apt-get install -y \
libxt6 \
libgl1-mesa-glx \
libcurl4-openssl-dev \
libglpk-dev \
libxml2-dev \
libproj-dev \
libudunits2-dev \
libgdal-dev \
libgsl-dev \
libbz2-dev \
libclang-dev \
libmagick++-6.q16-dev

USER rstudio

WORKDIR /home/rstudio

ENV CONDA=/home/rstudio/.local/share/r-miniconda/bin/

RUN R -e "install.packages('reticulate')"
RUN R -e "reticulate::install_miniconda()"
RUN $CONDA/conda init bash
COPY .profile /home/rstudio/

ENV PART=day1_python_and_R
COPY $PART/R_requirements.R .
RUN Rscript R_requirements.R
COPY $PART/environment.yml .
RUN $CONDA/conda env create \
-n $PART \
-f environment.yml

ENV PART=day1_RNA_velocity
COPY $PART/R_requirements.R .
RUN Rscript R_requirements.R
COPY $PART/environment.yml .
RUN $CONDA/conda env create \
-n $PART \
-f environment.yml

ENV PART=day3_interactive_visualization_iSEE
COPY $PART/R_requirements.R .
RUN Rscript R_requirements.R

ENV PART=day4_deep_generative_networks
COPY $PART/R_requirements.R .
RUN Rscript R_requirements.R
COPY $PART/environment.yml .
RUN $CONDA/conda env create \
-n $PART \
-f environment.yml

ENV PART=day1_differential_analysis
COPY $PART/R_requirements.R .
RUN Rscript R_requirements.R

ENV PART=day3_spatial_transcriptomics
COPY $PART/R_requirements.R .
RUN Rscript R_requirements.R

USER root
