# https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda
# https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/11.6.0/ubuntu2004/base/Dockerfile

<<<<<<< HEAD
# FROM nvidia/cuda:11.6.0-base-ubuntu20.04
FROM nvidia/cuda:11.7.0-base-ubuntu22.04
=======
FROM nvidia/cuda:11.6.0-base-ubuntu20.04
>>>>>>> 8442b6139c827eee44f227b366168d08c68473c3

# cudnn関連のファイルを呼ぶため(cupyでlibcublas.so.11を呼ぶため)
# FROM nvidia/cuda:11.6.0-devel-ubuntu20.04

# FROM ubuntu:latest
# FROM ubuntu:21.04
# https://ngc.nvidia.com/catalog/containersからPyTorch用のコンテナを取得
# FROM nvcr.io/nvidia/pytorch:21.02-py3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    bash \
    sudo wget vim cmake \
    coreutils \
    grep \
    iproute2 \
    iputils-ping \
    traceroute \
    tcpdump \
    bind9-dnsutils \
    dnsmasq-base \
    netcat-openbsd \
    iptables \
    procps \
    isc-dhcp-client \
    git \
    curl \
    ca-certificates \
    tzdata \
    libopencv-dev \
    opencv-data \
    libglib2.0-0 \
    libsm6 \
    libxrender1 \
    libxext6 \
    <<<<<<< HEAD
    ffmpeg 

RUN apt-get update && apt-get install -y \
    python3.9 \
=======
    ffmpeg \
    python3.7 \
>>>>>>> 8442b6139c827eee44f227b366168d08c68473c3
    python3 python3-pip \
    python3-dev \
    python3-pip \
    python3-wheel \
    python3-setuptools \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

# libglib2.0-0 libsm6 libxrender1 libxext6はopencvの関連パッケージ
# これは重いのでbuild後にインストールするのが良いかも
RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential gcc libsndfile1

RUN add-apt-repository ppa:deadsnakes/ppa


# # ユーザーの追加
# RUN useradd -m user
# RUN useradd -m {USERNAME}
# # ディレクトリの所有者の設定
# RUN chown -R user:user /home/user/

# userにユーザを変更
# USER user
USER ${USERNAME}


RUN mkdir $HOME/app
# RUN export TMPDIR=$HOME/app
# ワークスペースをインストールフォルダに変更
WORKDIR $HOME/app

COPY requirements.txt .
RUN pip3 install --upgrade pip
RUN pip3 install --no-cache-dir -r requirements.txt

RUN python3 -m spacy download en 
RUN python3 -m spacy download en_core_web_lg
RUN python3 -m nltk.downloader all

# ワークスペースを元に戻す
WORKDIR /

# Node.js インストール
# RUN sudo apt-get -y install nodejs npm
# RUN sudo -y curl -sL https://deb.nodesource.com/setup_15.x | sudo bash -
# RUN sudo apt -y install curl
# # RUN sudo apt -y install nodejs

# # RUN sudo apt-get -y update
# RUN sudo apt-get -y install nodejs
# RUN sudo apt-get -y install npm
# # RUN sudo npm cache clean
# RUN sudo npm install -y n -g
# RUN sudo n stable
# RUN sudo ln -sf /usr/local/bin/node /usr/bin/node

RUN mkdir /work

USER ${USERNAME}

# runした時にjupyter labをlocalhostで起動し、root、パスなし
# アクセスはブラウザでlocalhost:8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
# CMD ["bash", "-l"]
# CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''", "--NotebookApp.trust_xheaders=True", "--NotebookApp.disable_check_xsrf=True"]
