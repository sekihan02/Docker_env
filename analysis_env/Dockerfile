# FROM nvidia/cuda:10.2-cudnn8-runtime-ubuntu18.04
# https://gitlab.com/nvidia/container-images/cuda/-/blob/master/dist/10.2/ubuntu18.04/runtime/cudnn8/Dockerfile
FROM nvidia/cuda:11.1.1-cudnn8-runtime-ubuntu20.04

# FROM ubuntu:latest
# FROM ubuntu:21.04
# FROM nvidia/cuda:10.2-base-ubuntu18.04

# FROM nvidia/cuda:11.0-devel-ubuntu20.04
# https://ngc.nvidia.com/catalog/containersからPyTorch用のコンテナを取得
# FROM nvcr.io/nvidia/pytorch:21.02-py3
# ARG USERNAME
ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y
RUN apt-get -y upgrade
# Docker Ubuntu18.04をtimezoneの選択をしないでinstall
RUN apt-get -y install tzdata
RUN apt-get -y install sudo wget vim
RUN apt-get -y install libopencv-dev opencv-data
# libglib2.0-0 libsm6 libxrender1 libxext6はopencvの関連パッケージ
# # これは重いのでbuild後にインストールするのが良いかも
RUN apt-get -y install libglib2.0-0 libsm6 libxrender1 libxext6
RUN apt-get -y install ffmpeg
RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential gcc libsndfile1

RUN apt-get -y install python3 python3-pip
# ワークスペースをインストールフォルダに変更
WORKDIR /opt

# # download anaconda package and install anaconda
# # archive -> https://repo.continuum.io/archive/
# RUN wget https://repo.anaconda.com/archive/Anaconda-1.4.0-Linux-x86_64.sh && \
# 	# /opt/anaconda3にインストール
# 	sh Anaconda-1.4.0-Linux-x86_64.sh.sh -b -p /opt/anaconda3 && \
# 	# 使用したファイルの削除
# 	rm -f Anaconda-1.4.0-Linux-x86_64.sh
# # パスを通す
# ENV PATH /opt/anaconda3/bin:$PATH

# aptをアップデートしてから必要なパッケージをインストールする
# RUN apt update && apt upgrade -y \
# && yes | pip install -U pip \

RUN pip3 install tqdm 
# numpy==1.19.5 pandas==1.1.5
RUN pip3 install matplotlib==3.3.4 seaborn
RUN pip3 install japanize-matplotlib
RUN pip3 install scipy==1.5.4
RUN pip3 install statsmodels
RUN pip3 install scikit-learn scikit-image
# RUN pip3 install jupyter jupyter lab
RUN pip3 install jupyter==1.0.0
RUN pip3 install jupyterlab==2.1.5
# CUDA Toolkitのバージョンが10.2
# RUN pip3 install cupy-cuda102
# RUN pip3 install cupy-cuda111
# cu10.2 PyTorch
# RUN pip3 install torch torchvision torchaudio
RUN pip3 install torch==1.9.0+cu111 torchvision==0.10.0+cu111 torchaudio==0.9.0 -f https://download.pytorch.org/whl/torch_stable.html

RUN pip3 install lightgbm
RUN pip3 install xgboost==1.2.1
RUN pip3 install -U pip
RUN pip3 install opencv-python
RUN pip3 install ffmpeg-python
RUN pip3 install pyvis

# RUN pip3 install pytorch-transformers
# RUN pip3 install transformers
# https://github.com/karolzak/ipyplot
# ipyplot.plot_images(images_array, max_images=20, img_width=150)
RUN pip3 install ipyplot
RUN pip3 install torchsummary
RUN pip3 install tabulate
RUN pip3 install ptitprince
RUN pip3 install matplotlib-venn
RUN pip3 install albumentations
RUN pip3 install ttach
RUN pip3 install grad-cam ttach
RUN pip3 install lightly
RUN pip3 install pyro-ppl==1.7.0
RUN pip3 install librosa

# RUN pip3 install spacy
RUN pip3 install texthero
RUN python3 -m spacy download en
RUN python3 -m spacy download en_core_web_lg
RUN pip3 install timm

RUN pip3 install transformers
# RUN pip3 uninstall fsspec -qq -y
# # RUN pip3 install --no-index --find-links ../input/hf-datasets/wheels datasets -qq
# 文字オブジェクトのインスタンス化
RUN pip3 install datasets
# RUN pip3 install tensorflow==2.6.0
RUN pip3 install tensorflow-gpu

# ワークスペースを元に戻す
WORKDIR /

RUN mkdir /work

# USER ${USERNAME}

# runした時にjupyter labをlocalhostで起動し、root、パスなし
# アクセスはブラウザでlocalhost:8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
# CMD ["bash", "-l"]
