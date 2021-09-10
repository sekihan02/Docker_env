@REM 2回目以降の起動時
docker run -p 8888:8888 --rm --gpus all -v C:\Users\akaha\Documents\docker\workspace\RL_env\work:/work  -w /work --name rl_env reinforcement_learning_env
