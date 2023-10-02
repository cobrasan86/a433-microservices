# !/bin/bash
# Author : Cobrasan86

#Melakukan build docker image dari Dockerfile dan merubah menerapkan tag
docker build -t karsajobs:latest .
docker image tag karsajobs:latest ghcr.io/cobrasan86/karsajobs:latest

#Login ke Github Container Registry (Github Packages)
echo $TOKENKU | docker login ghcr.io -u cobrasan86 --password-stdin

#Melakukan push image ke Github Packages
docker image push ghcr.io/cobrasan86/karsajobs:latest
