#!/bin/bash

# Update packages
sudo apt-get update

# Install curl
sudo apt-get install -y curl

# Use curl to download and run the starship installer script
sudo curl -sS https://starship.rs/install.sh | sudo sh -s -- -y

# Define the source and destination folders
source_folder="./config_folder/*"
destination_folder="$HOME/.config"

source_file="./bashrc_example"
destination_file="$HOME/.bashrc"

# Copy the config folder to the destination folder
sudo cp -r $source_folder $destination_folder

# Copy the bashrc_example file to the destination file
sudo cp $source_file $destination_file


sudo chown -R $USER:$USER $HOME/*
