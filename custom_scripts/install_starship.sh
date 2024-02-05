# #!/bin/bash

# echo -e "\e[32mUpdating packages and installing git and curl\e[0m"
# sudo apt-get update
# sudo apt-get install -y git curl unzip

# echo -e "\e[32mInstalling starship\e[0m"
# curl -sS https://starship.rs/install.sh | sh -s -- -y

# if ! grep -q "eval \"\$(starship init bash)\"" ~/.bashrc; then
# echo -e "\e[32mAdding starship to .bashrc\e[0m"
# echo 'eval "$(starship init bash)"' >> ~/.bashrc
# else
# echo -e "\e[32mStarship already in .bashrc\e[0m"
# fi

# echo -e "\e[32mCloning scripts repo\e[0m"
# git clone https://github.com/RKolibri/scripts.git ~/scripts

# echo -e "\e[32mCreating directory if it does not exist\e[0m"
# mkdir -p ~/.config

# echo -e "\e[32mCopying files from source to destination\e[0m"
# cp ~/scripts/config_folder/starship.toml ~/.config/starship.toml

# echo -e "\e[32mDisabling password authentication\e[0m"
# sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/g' /etc/ssh/sshd_config


# echo -e "\e[32mRemoving scripts dir\e[0m"
# sudo rm -r ~/scripts

# exec bash
