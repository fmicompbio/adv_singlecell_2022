FROM jupyter/scipy-notebook:latest

USER root

# install libvips for TissUUmaps
RUN apt-get update
#RUN apt-get install libvips -y
RUN apt install libvips-dev -y
RUN apt-get install openslide-tools	

user jovyan

# create directory for TissUUmaps
RUN mkdir -p ~/.tissuumaps/plugins

# install TissUUmaps feature space plugin
RUN wget -P ~/.tissuumaps/plugins https://tissuumaps.github.io/TissUUmaps/plugins/Feature_Space.yml
RUN wget -P ~/.tissuumaps/plugins https://tissuumaps.github.io/TissUUmaps/plugins/Feature_Space.py
RUN wget -P ~/.tissuumaps/plugins https://tissuumaps.github.io/TissUUmaps/plugins/Feature_Space.js

# install dependencies for interaction
RUN pip install tissuumaps
RUN pip install pooch
RUN pip install scikit-image
RUN pip install spatial-analysis-toolkit[tissuumaps]

# install dependencies for spatial analysis
#RUN pip install scanpy>=1.9.0
#RUN pip install scvi-tools>=0.15.4
#RUN pip install git+https://github.com/theislab/squidpy@master
#RUN pip install git+https://github.com/almaan/eggplant@master
#RUN pip install nb_black
#RUN pip install scikit-misc
