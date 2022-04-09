First, build the docker image.

```bash
cd /path/to/day3_spatial_transcriptomics
docker build . -t jupyterlab-tissuumaps
```

Next, start the jupyterlab-tissuumaps container. 

```bash
docker run -it --rm -p 10000:8888 -p 5100-5200:5100-5200 -v "${PWD}":/home/jovyan/work jupyterlab-tissuumaps

```

Open a web browser and connect to the jupyter server. You will see a message like the following in your terminal. This gives the token required to connect to the jupyter server. Copy the token following `?token=`. In your browser navigate to `http://localhost:10000/?token=<token>`. In this example, it would be `http://localhost:10000/?token=eb26702ff43fd03498ce8b78f49dba2eded58d903aaa7f42`

```
    To access the server, open this file in a browser:
        file:///home/jovyan/.local/share/jupyter/runtime/jpserver-8-open.html
    Or copy and paste one of these URLs:
        http://94a824b3af9e:8888/lab?token=eb26702ff43fd03498ce8b78f49dba2eded58d903aaa7f42
     or http://127.0.0.1:8888/lab?token=eb26702ff43fd03498ce8b78f49dba2eded58d903aaa7f42

```

Navigate to the `work` directory in the file browser and run the `tissuumaps_test.ipynb` notebook