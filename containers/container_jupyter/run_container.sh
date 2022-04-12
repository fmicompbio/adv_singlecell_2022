docker run \
-e NB_UMASK=002 \
-e JUPYTER_ENABLE_LAB=yes \
-e JUPYTER_TOKEN=test123 \
-p 8888:8888 \
-p 5100-5200:5100-5200 \
geertvangeest/adv_singlecell_2022-jupyter \
start-notebook.sh
