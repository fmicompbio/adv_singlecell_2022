FROM jupyter/minimal-notebook:latest

USER root
RUN cat /etc/skel/.bashrc >> /etc/bash.bashrc

RUN apt-get update

RUN apt-get install -y \
curl \
libhdf5-dev \
gcc \
g++ \
libtool \
openslide-tools	\
libvips-dev

# RUN mkdir -p /home/juser/workdir

ENV PLUGINDIR=/home/jovyan/.tissuumaps/plugins

USER $NB_UID
# create directory for TissUUmaps
RUN mkdir -p ${PLUGINDIR}

# install TissUUmaps feature space plugin
RUN wget -P ${PLUGINDIR} https://tissuumaps.github.io/TissUUmaps/plugins/Feature_Space.yml
RUN wget -P ${PLUGINDIR} https://tissuumaps.github.io/TissUUmaps/plugins/Feature_Space.py
RUN wget -P ${PLUGINDIR} https://tissuumaps.github.io/TissUUmaps/plugins/Feature_Space.js

# install TissUUmaps histogram plugin
RUN wget -P ${PLUGINDIR} https://tissuumaps.github.io/TissUUmaps/plugins/Plot_Histogram.yml
RUN wget -P ${PLUGINDIR} https://tissuumaps.github.io/TissUUmaps/plugins/Plot_Histogram.py
RUN wget -P ${PLUGINDIR} https://tissuumaps.github.io/TissUUmaps/plugins/Plot_Histogram.js

# change back to notebook user
ENV CONDA=/opt/conda/bin

ENV PART=day2_multi-omics
COPY $PART/environment.yml .
RUN $CONDA/conda env create \
-n $PART \
-f environment.yml

ENV PART=day3_spatial_transcriptomics
COPY $PART/environment.yml .
RUN $CONDA/conda env create \
-n $PART \
-f environment.yml

RUN /opt/conda/bin/conda install -y nb_conda_kernels

RUN rm -r /home/jovyan/work/
RUN rm environment.yml
