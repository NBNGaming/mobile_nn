FROM nvidia/cuda:12.3.1-devel-ubuntu22.04

RUN apt-get update && apt-get install --no-install-recommends -y curl screen python3 build-essential python3-pip
RUN apt-get install ffmpeg libsm6 libxext6 -y && apt clean
RUN pip3 install torch torchvision torchaudio

WORKDIR /usr/src/app
COPY ./ultralytics ultralytics
RUN pip3 install --no-cache-dir -e ultralytics
COPY ./train.py train.py
COPY ./val.py val.py
COPY ./custom.yaml custom.yaml
