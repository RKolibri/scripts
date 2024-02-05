#!/bin/bash


# Add Docker's official GPG key to /etc/apt/keyrings:
echo -e "\033[32mAdding Docker's official GPG key...\033[0m"
sudo apt-get update
sudo apt-get install -y ca-certificates curl gnupg
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

# Add the repository to Apt sources:
echo -e "\033[32mAdding the repository to Apt sources...\033[0m"
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(. /etc/os-release && echo $VERSION_CODENAME) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

# Install Docker packages
echo -e "\033[32mInstalling Docker packages...\033[0m"
sudo apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Add the current user to the docker group
echo -e "\033[32mAdding the current user to the docker group...\033[0m"
sudo usermod -aG docker $USER

echo -e "\033[32mDo you want to install Portainer Community Edition (CE) or Enterprise Edition (EE)?\033[0m"
read -p "Enter CE or EE or anything else to cancel: " edition


if [ "$edition" == "CE" ]; then
  echo -e "\033[32mPulling the Portainer Community Edition image...\033[0m"
  sudo docker pull portainer/portainer-ce
  tag="portainer/portainer-ce:latest"
elif [ "$edition" == "EE" ]; then
  echo -e "\033[32mPulling the Portainer Enterprise Edition image...\033[0m"
  sudo docker pull portainer/portainer-ee
  tag="portainer/portainer-ee:latest"
else
  echo -e "\033[31mInvalid option. Exiting.\033[0m"
  exit 1
fi

# Creating a data volume for Portainer
echo -e "\033[32mCreating a data volume for Portainer...\033[0m"
sudo docker volume create portainer_data

# Running a Portainer container
echo -e "\033[32mRunning a Portainer container...\033[0m"
sudo docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data $tag
