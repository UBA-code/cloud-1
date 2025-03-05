#!/bin/sh

set -x

apt update
apt install -y pip
pip install ansible --break-system-package