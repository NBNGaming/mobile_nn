FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu22.04

RUN apt-get update && apt-get install --no-install-recommends -y curl screen python3 build-essential python3-pip
RUN apt-get install ffmpeg libsm6 libxext6 -y && apt clean
RUN python3 -m pip install --upgrade pip wheel
RUN pip3 install torch torchvision torchaudio

WORKDIR /usr/src/app
COPY ./ultralytics-repo ultralytics-repo
WORKDIR /usr/src/app/ultralytics-repo
RUN pip3 install --no-cache-dir -e .

WORKDIR /usr/src/app
COPY ./train.py train.py
COPY ./val.py val.py
COPY ./custom.yaml custom.yaml
