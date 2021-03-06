#!/bin/bash
# Based on Jonathan Calmels approachhttps://github.com/NVIDIA/nvidia-docker/wiki/Deploy-on-Amazon-EC2

# Install NVIDIA drivers 361.42
sudo apt-get install --no-install-recommends -y gcc make libc-dev
wget -P /tmp http://us.download.nvidia.com/XFree86/Linux-x86_64/361.42/NVIDIA-Linux-x86_64-361.42.run
sudo sh /tmp/NVIDIA-Linux-x86_64-361.42.run --silent

# Install nvidia-docker and nvidia-docker-plugin
wget -P /tmp https://github.com/NVIDIA/nvidia-docker/releases/download/v1.0.1/nvidia-docker_1.0.1-1_amd64.deb
sudo dpkg -i /tmp/nvidia-docker*.deb && rm /tmp/nvidia-docker*.deb

# Tests install
sudo nvidia-docker run --rm nvidia/cuda nvidia-smi

