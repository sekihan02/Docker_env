@REM 2回目以降の起動時
docker run -p 8888:8888 --rm --gpus all --shm-size=256m  -v C:\Users\Public\Documents\github\Docker_env\analysis_env\work:/work -w /work --name my_env analysis_env
