#!/bin/sh

apt update
apt install -y snapd
snap install microk8s --classic
microk8s status --wait-ready
microk8s enable dns hostpath-storage registry
microk8s kubectl apply -f https://raw.githubusercontent.com/theSimpleCloud/SimpleCloud-v3-Install/main/content-server-pod.yml
microk8s kubectl apply -f https://raw.githubusercontent.com/theSimpleCloud/SimpleCloud-v3-Install/main/proxy-service.yml
microk8s kubectl apply -f https://raw.githubusercontent.com/theSimpleCloud/SimpleCloud-v3-Install/main/simplecloud-pod.yml
