# https://catalog.ngc.nvidia.com/orgs/nvidia/containers/cuda
# https://gitlab.com/nvidia/container-images/cuda/blob/master/dist/11.6.0/ubuntu2004/base/Dockerfile
FROM nvidia/cuda:11.6.0-base-ubuntu20.04

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
    ffmpeg \
    python3.7 \
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

RUN pip3 install tqdm \
    matplotlib \
    seaborn \
    japanize-matplotlib \
    scipy==1.5.4 \
    statsmodels \
    scikit-learn scikit-image \
    jupyter==1.0.0 \
    jupyterlab==3.5.2 \
    lightgbm \
    xgboost==1.6.0 \
    pip --upgrade \
    opencv-python \
    opencv-contrib-python \
    ffmpeg-python \
    pyvis \
    ipyplot \
    torchsummary \
    tabulate \
    ptitprince \
    matplotlib-venn \
    albumentations \
    albumentations[imgaug] \
    texthero \
    datasets \
    torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/cu116 \
    sentencepiece \
    transformers==4.24.0 \
    timm \
    segmentation-models-pytorch==0.2.0 \
    grad-cam ttach \
    lightly \
    pyro-ppl==1.7.0 \
    librosa==0.9.1 \
    colorednoise \
    catboost \
    tokenizers==0.12.1 \
    tez \
    scrapy==1.6.0 \
    imblearn \
    tensorflow-gpu \
    faiss-gpu

RUN python3 -m spacy download en 
RUN python3 -m spacy download en_core_web_lg
RUN python3 -m nltk.downloader all

# ワークスペースを元に戻す
WORKDIR /

RUN mkdir /work

USER ${USERNAME}

# runした時にjupyter labをlocalhostで起動し、root、パスなし
# アクセスはブラウザでlocalhost:8888
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]
# CMD ["bash", "-l"]
