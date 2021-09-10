@REM 2回目以降の起動時
docker run -p 8080:8888 --rm -v C:\Users\akaha\Documents\docker\workspace\RL_book_env\work:/work -w /work --name rl_book_env reinforcement_learning_book_env
