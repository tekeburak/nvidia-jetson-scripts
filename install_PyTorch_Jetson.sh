#!/bin/bash

echo "=================================================
| PyTorch and torchvision for NVIDIA Jetson TX2 |
================================================="

# Change the commit ID that you want to install
PYTORCH_COMMIT_ID="3a47d5694691642c730bf99ccbcaa81f09fcb60e"

# Clone, checkout specific commit and build for GPU with CUDA support
git clone --recursive https://github.com/pytorch/pytorch.git &&\
cd pytorch && git checkout ${PYTORCH_COMMIT_ID} && \
git submodule update --init --recursive  &&\


echo "=========================================
| Installing requirements of PyTorch... |
========================================="

pip3 install -r requirements.txt --user &&\

echo "============================================
| Build from source; it might take a while |
============================================"

sudo python3 setup.py build &&\

echo "=========================
| Installing PyTorch... |
========================="

sudo -E python3 setup.py install &&\

echo "=============================
| Installing torchvision... |
============================="

pip3 install --user --no-deps torchvision &&\

# Clean up resources
echo "=====================
Deleting the resource
====================="
sudo rm -R pytorch &&\

echo "Finished..."
