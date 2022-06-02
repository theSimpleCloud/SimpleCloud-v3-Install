#!/bin/sh

apt update
apt install snapd
snap install microk8s --classic
microk8s status --wait-ready
microk8s enable dns host-storage registry
