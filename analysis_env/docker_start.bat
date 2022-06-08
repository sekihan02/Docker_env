@REM 2回目以降の起動時
<<<<<<< HEAD
@REM docker run -p 8888:8888 --rm --gpus all --shm-size=2gb  -v C:\Users\Public\Documents\github\Docker_env\analysis_env\work:/work -w /work --name my_env analysis_env
docker run -p 8888:8888 --rm --gpus all --shm-size=32gb  -v C:\Users\Public\Documents\github\Docker_env\analysis_env\work:/work -w /work --name my_env analysis_env
=======
docker run -p 8888:8888 --rm --gpus all --shm-size=256m  -v C:\Users\Public\Documents\github\Docker_env\analysis_env\work:/work -w /work --name my_env analysis_env
>>>>>>> 71dc76d76715a4bb4515b7f877b8406b18f6b01d
