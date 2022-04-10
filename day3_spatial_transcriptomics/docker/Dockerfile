FROM jupyter/scipy-notebook:latest

USER root

RUN apt-get update
RUN apt-get install libvips -y

user jovyan

RUN pip install tissuumaps
RUN pip install pooch
RUN pip install scikit-image
