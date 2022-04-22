docker run \
--user root \
-e NB_USER=juser \
-e NB_UID=1000 \
-e NB_UMASK=002 \
-w /home/juser \
-e CHOWN_HOME=yes \
-e JUPYTER_ENABLE_LAB=yes \
-e JUPYTER_TOKEN=test123 \
-p 8888:8888 \
-p 5100-5200:5100-5200 \
geertvangeest/adv_singlecell_2022-jupyter \
start-notebook.sh
