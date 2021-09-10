# FROM ubuntu:latest
# FROM ubuntu:21.04
FROM ubuntu:18.04
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

RUN apt-get -y install python3.7 python3-pip

# Node.js インストール
# RUN sudo apt-get -y install nodejs npm
RUN sudo -y curl -sL https://deb.nodesource.com/setup_15.x | sudo bash -
RUN sudo apt -y install curl
# RUN sudo apt -y install nodejs

# RUN sudo apt-get -y update
RUN sudo apt-get -y install nodejs
RUN sudo apt-get -y install npm
# RUN sudo npm cache clean
RUN sudo npm install -y n -g
RUN sudo n stable
RUN sudo ln -sf /usr/local/bin/node /usr/bin/node

RUN npm install -g @lux-ai/2021-challenge@latest

# RUN sudo apt-get -qq -y install xvfb freeglut3-dev ffmpeg > /dev/null
RUN sudo apt-get -y install xvfb
RUN sudo apt-get -y install freeglut3-dev

RUN sudo apt-get -y install git
RUN sudo apt-get -y install python-opengl
RUN sudo apt -y purge python2.7-minimal
RUN sudo apt -y install libosmesa6-dev libgl1-mesa-glx libglfw3

# ワークスペースをインストールフォルダに変更
WORKDIR /opt

# aptをアップデートしてから必要なパッケージをインストールする
# RUN apt update && apt upgrade -y \
# && yes | pip install -U pip

RUN pip3 install tqdm numpy==1.19.5 pandas==1.1.5
RUN pip3 install matplotlib==3.3.4
RUN pip3 install seaborn
RUN pip3 install japanize-matplotlib
RUN pip3 install scipy==1.5.4
RUN pip3 install scikit-learn
RUN pip3 install scikit-image
RUN pip3 install jupyter==1.0.0
RUN pip3 install jupyterlab==2.1.5
# CUDA Toolkitのバージョンが10.2
RUN pip3 install cupy-cuda102
RUN pip3 install tensorflow-gpu==1.14.0
# RUN pip3 install tensorflow==1.14.0
RUN pip3 install torch
RUN pip3 install torchvision
RUN pip3 install torchaudio
RUN pip3 install lightgbm

RUN pip3 install -U pip
RUN pip3 install opencv-python
RUN pip3 install ffmpeg-python
RUN pip3 install pyvis

RUN pip3 install pytorch-transformers
RUN pip3 install transformers
RUN pip3 install ipyplot
RUN pip3 install matplotlib-venn
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

RUN pip3 install spacy
RUN pip3 install texthero
RUN python3 -m spacy download en
RUN python3 -m spacy download en_core_web_lg
RUN pip3 install timm

# RUN pip3 install transformers
# RUN pip3 uninstall fsspec -qq -y
# RUN pip3 install --no-index --find-links ../input/hf-datasets/wheels datasets -qq
# 文字オブジェクトのインスタンス化

RUN pip3 install datasets
RUN pip3 install kaggle-environments -U

RUN pip3 install gym==0.14.0
RUN pip3 install h5py==2.9.0 
RUN pip3 install pygame==1.9.6 
RUN pip3 install baselines==0.1.2

RUN pip3 install pyvirtualdisplay
RUN pip3 install gym-notebook-wrapper

RUN pip3 install pyopengl
RUN pip3 install pyvirtualdisplay
RUN pip3 install pyglet
# RUN pip3 uninstall pyglet -y
# RUN pip3 install pyglet==1.2.4
# RUN pip3 install -U 'mujoco-py<2.1,>=2.0'
RUN pip3 install mujoco_py==2.0.2.8
RUN pip3 install -e git+git://github.com/ntasfi/PyGame-Learning-Environment.git#egg=ple
RUN pip3 install -e git+https://github.com/lusob/gym-ple.git#egg=gym-ple
RUN pip3 install -f https://github.com/Kojoley/atari-py/releases atari_py

RUN pip3 install gym[box2d]
RUN pip3 install gym[atari]
RUN pip3 install gym[classic_control]
RUN pip3 install gym[all]

WORKDIR /

# DISPLAY 設定
RUN echo "export DISPLAY=localhost:0.0 " >> /etc/profile
# RUN echo "export DISPLAY=0.0 " >> /etc/profile

RUN mkdir /work

USER ${USERNAME}

# runした時にjupyter labをlocalhostで起動し、root、パスなし
# アクセスはブラウザでlocalhost:8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
# CMD ["bash", "-l"]
