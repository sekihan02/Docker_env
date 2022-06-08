# https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda
# https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/11.6.0/ubuntu2004/base/Dockerfile
FROM nvidia/cuda:11.6.0-base-ubuntu20.04
# FROM nvidia/cuda:11.5.0-base-ubuntu20.04

# FROM ubuntu:latest
# FROM ubuntu:21.04
# https://ngc.nvidia.com/catalog/containersからPyTorch用のコンテナを取得
# FROM nvcr.io/nvidia/pytorch:21.02-py3

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
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
    ffmpeg \
    python3 python3-pip \
    sudo \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*

RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get -y install python3.9 \
    sudo wget vim cmake
# libglib2.0-0 libsm6 libxrender1 libxext6はopencvの関連パッケージ
# # これは重いのでbuild後にインストールするのが良いかも
RUN apt-get update -y && apt-get install -y --no-install-recommends build-essential gcc libsndfile1

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

RUN pip3 install tqdm 
RUN pip3 install matplotlib
RUN pip3 install seaborn
RUN pip3 install japanize-matplotlib
RUN pip3 install scipy==1.5.4
RUN pip3 install statsmodels
RUN pip3 install scikit-learn scikit-image
# RUN pip3 install jupyter jupyter lab
RUN pip3 install jupyter==1.0.0
RUN pip3 install jupyterlab==2.1.5

RUN pip3 install lightgbm
RUN pip3 install xgboost==1.6.0
RUN pip3 install pip --upgrade
RUN pip3 install opencv-python
RUN pip3 install opencv-contrib-python
RUN pip3 install ffmpeg-python
RUN pip3 install pyvis

RUN pip3 install ipyplot
RUN pip3 install torchsummary
RUN pip3 install tabulate
RUN pip3 install ptitprince
RUN pip3 install matplotlib-venn
RUN pip3 install albumentations

RUN pip3 install texthero
RUN python3 -m spacy download en
RUN python3 -m spacy download en_core_web_lg
# 文字オブジェクトのインスタンス化
RUN pip3 install datasets
# RUN pip3 install tensorflow==2.8.0
# RUN pip3 install tensorflow-gpu==1.15
RUN pip3 install tensorflow-gpu

RUN pip3 install torch==1.10.2+cu113 torchvision==0.11.3+cu113 torchaudio==0.10.2+cu113 -f https://download.pytorch.org/whl/cu113/torch_stable.html
RUN pip3 install transformers
RUN pip3 install timm

RUN pip3 install ttach
RUN pip3 install grad-cam ttach
RUN pip3 install lightly
RUN pip3 install pyro-ppl==1.7.0
RUN pip3 install librosa==0.9.1

RUN pip3 install colorednoise
RUN pip3 install catboost
# ワークスペースを元に戻す
WORKDIR /

RUN mkdir /work

USER ${USERNAME}

# runした時にjupyter labをlocalhostで起動し、root、パスなし
# アクセスはブラウザでlocalhost:8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
# CMD ["bash", "-l"]
