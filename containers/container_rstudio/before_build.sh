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

BUILDDIR=containers/container_rstudio/

for DIR in day?_*
do
    mkdir -p $BUILDDIR/$DIR

    diff -q $DIR/R_requirements.R $BUILDDIR/$DIR/R_requirements.R
    
    if [ $? != 0 ]
    then
      echo "updating R file of $DIR"
      cp $DIR/R_requirements.R $BUILDDIR/$DIR/R_requirements.R
    else
      echo "no need to update R file of $DIR"
    fi

    if [ -f $DIR/environment.yml ]
    then
        cp $DIR/environment.yml $BUILDDIR/$DIR/tmp.yml
    else 
        echo "translating $PWD/$DIR/requirements.txt"
        pip_to_conda $DIR/requirements.txt $BUILDDIR/$DIR/tmp.yml
    fi

    if [ -f $BUILDDIR/$DIR/environment.yml ]
    then
      diff -q $BUILDDIR/$DIR/tmp.yml $BUILDDIR/$DIR/environment.yml 
      if [ $? != 0 ]
      then
        echo "updating yml file of $DIR"
        mv $BUILDDIR/$DIR/tmp.yml $BUILDDIR/$DIR/environment.yml
      else
        echo "no need to update yml of $DIR"
      fi
    else 
      mv $BUILDDIR/$DIR/tmp.yml $BUILDDIR/$DIR/environment.yml
    fi
      rm $BUILDDIR/$DIR/tmp.yml
done
