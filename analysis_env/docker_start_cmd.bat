@REM 起動
docker run -it --rm --gpus all --shm-size=32gb  -v C:\Users\Public\Documents\github\Docker_env\analysis_env\work:/work -w /work --name my_env analysis_env bash
