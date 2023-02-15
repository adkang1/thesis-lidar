# 1) choose base container
# generally use the most recent tag

# base notebook, contains Jupyter and relevant tools
# See https://github.com/ucsd-ets/datahub-docker-stack/wiki/Stable-Tag 
# for a list of the most current containers we maintain
ARG BASE_CONTAINER=ucsdets/scipy-ml-notebook:2023.1-stable

FROM $BASE_CONTAINER

LABEL maintainer="UC San Diego ITS/ETS <ets-consult@ucsd.edu>"

# 2) change to root to install packages
USER root

RUN apt-get -y install htop

RUN apt update && apt install -y python3-pip nvidia-cuda-toolkit

# 3) install packages using notebook user
USER thesis-lidar:adkang

# RUN conda install -y scikit-learn

RUN pip install -y --no-cache-dir networkx scipy numpy

# Override command to disable running jupyter notebook at launch
# CMD ["/bin/bash"]
