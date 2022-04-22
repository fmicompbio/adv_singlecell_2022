docker run \
--rm \
--user root \
-e NB_UMASK=002 \
-e GRANT_SUDO=yes \
-e JUPYTER_ENABLE_LAB=yes \
-e JUPYTER_TOKEN=test123 \
-p 8888:8888 \
geertvangeest/adv_singlecell_2022-jupyter \
start-notebook.sh
