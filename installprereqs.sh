#!/usr/bin/env bash

# Prerequisites
sudo apt-get install --assume-yes jq

# Get URLs for most recent versions
terraform_url=$(curl https://releases.hashicorp.com/index.json | jq '{terraform}' | egrep "linux.*amd64" | sort --version-sort -r | head -1 | awk -F[\"] '{print $4}')

# Create a move into directory.
mkdir terraform && cd $_

# Download Terraform. URI: https://www.terraform.io/downloads.html
echo "Downloading $terraform_url."
curl -o terraform.zip $terraform_url
# Unzip and install
unzip terraform.zip


echo '
# Terraform path.
export PATH=~/terraform/:$PATH
' >>~/.bashrc

source ~/.bashrc
which terraform
terraform version

