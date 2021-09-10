@REM インタラクティブに使用したい場合
docker run --rm -it -v C:\Users\akaha\Documents\docker\workspace\sunaba\work:./work -w ./work --name compile_test make_compiler

@REM コンテナの中でmakeを実行してソースファイルtestをコンパイル
@REM docker run --rm -v C:/Users/akaha/Documents/docker/workspace/sunaba/work:/work  -w /work --name compile_test make_compiler make test
@REM docker run --rm -v C:/Users/akaha/Documents/docker/workspace/sunaba/work:/work  -w /work --name compile_test make_compiler make clean
