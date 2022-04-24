## needs to be executed in admin container

# install gdown (not pre-installed)
pip install gdown

# data for day4_deep_generative_networks
cd ~
DATADIR=/data/day4_deep_generative_networks
gdown https://drive.google.com/uc?id=1QhWegMDYRyKgciTnpLAgNvCoWS0V-MlA
sudo mkdir -p $DATADIR
sudo mv SC_adv_school_2022.tar $DATADIR
cd $DATADIR
sudo tar -xvf SC_adv_school_2022.tar

# data for day2_multi-omics
cd ~
DATADIR=/data/day2_multi-omics
gdown https://drive.google.com/uc?id=1NxleY0LjhTMMWGhzWxn4xmAPZjllkGVd
sudo mkdir -p $DATADIR
sudo mv vertical.mofa_trained.h5ad $DATADIR 

cd ~
gdown https://drive.google.com/uc?id=1RMKUdyE6DwI4kc_oZUSCpzPfNlfrizD3
sudo mv multiomics_data.tar.gz $DATADIR
cd $DATADIR
sudo tar -xvf multiomics_data.tar.gz
sudo mv home/jovyan/mount/gdrive/sc-multiomics-course-2022/gr2_matched_vertical/multiomics_data/* \
$DATADIR
sudo rm -r ./home

## Manually upload pbmc3k.rds file to
# /data/day3_interactive_visualization_iSEE

# data for day3_spatial_transcriptomics
cd ~
DATADIR=/data/day3_spatial_transcriptomics
wget https://hmgubox2.helmholtz-muenchen.de/index.php/s/HMKcWBpwNBQ2gSS/download/advomics_data_spatial.tar.gz
sudo mkdir -p $DATADIR
sudo mv advomics_data_spatial.tar.gz $DATADIR
cd $DATADIR 
sudo tar -xvf advomics_data_spatial.tar.gz

