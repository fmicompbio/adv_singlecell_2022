#!/usr/bin/env bash

cd ../..

pip_to_conda () {
  REQ=$1
  OUT=$2

  echo """
channels:
  - conda-forge
  - bioconda
dependencies:
  - python=3.8
  - pip
  - pip:""" > $OUT 

 grep -v "^#" $REQ | sed 's/^/    - /g' >> $OUT

}

for DIR in day?_*
do
    mkdir -p containers/container_rstudio/$DIR
    cp $DIR/R_requirements.R containers/container_rstudio/$DIR

    if [ -f $DIR/environment.yml ]
    then
        cp $DIR/environment.yml containers/container_rstudio/$DIR
    else 
        pip_to_conda $DIR/requirements.txt containers/container_rstudio/$DIR/environment.yml
    fi
done
