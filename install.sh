#!/bin/bash

# Update packages
sudo apt-get update

# Install curl
sudo apt-get install -y curl

# Use curl to download and run the starship installer script
curl -sS https://starship.rs/install.sh | sudo sh -s -- -y

# Define the source and destination folders
source_folder="./config"
destination_folder="~/.config"

source_file="./bashrc_example"
destination_file="~/.bashrc"

# Copy the config folder to the destination folder
cp -r $source_folder $destination_folder

# Copy the bashrc_example file to the destination file
cp $source_file $destination_file
