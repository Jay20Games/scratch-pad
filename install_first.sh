#!/bin/bash

clear
  echo "#######################################################"
  echo "###         Preparing for Installation              ###"
  echo "#######################################################"
  echo "Installing Docker, Docker-Compose, Portainer and Webmin"
  echo "#######################################################"
  sleep 3s

  echo "########################################################"
  echo "####        Install APT Updates and Upgrades        ####"
  echo "########################################################"
  echo ""
  
sudo apt update && sudo apt upgrade -y

  echo "#######################################################"
  echo "APT update and upgrade finished."
  echo "#######################################################"
  echo ""
  sleep 2s

  echo "###############################################"
  echo "######         Install Docker-CE         ######"
  echo "###############################################"
  echo ""

curl -fsSL https://get.docker.com | sh >> ~/docker-script-install.log 2>&1

  echo "###############################################"
  echo "- docker-ce version is now:"
  docker -v
  echo "###############################################"
  echo ""
  sleep 5s

  echo "###############################################"
  echo "  - Attempting to add the currently logged in user to the docker group..."
  echo "###############################################"
  echo ""
  sleep 2s
  
  sudo usermod -aG docker "${USER}" >> ~/docker-script-install.log 2>&1
  echo "###############################################"
  echo "  - You'll need to log out and back in to finalize the addition of your user to the docker group."
  echo "###############################################"
  echo ""
  sleep 3s
  
  echo "####################################################"
  echo "######         Install Docker-Compose         ######"
  echo "####################################################"
  echo ""
  
sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose >> ~/docker-script-install.log
sudo chmod +x /usr/local/bin/docker-compose >> ~/docker-script-install.log

  echo "###############################################"
  echo "- Docker Compose Version is now: " 
  docker-compose --version
  echo "###############################################"
  echo ""
  sleep 3s

  echo "###############################################"
  echo "###         Installing Portainer-CE         ###"
  echo "###############################################"
  echo ""

docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:2.11.1
  echo ""
  echo "###############################################"
  echo "    Navigate to your server hostname / IP address on port 9443 and create your admin account for Portainer-CE"
  echo "###############################################"
  echo ""
  sleep 3s

  echo "#########################################"
  echo "###         Installing Webmin         ###"
  echo "#########################################"
  echo ""

sudo apt-add-repository "deb https://download.webmin.com/download/repository sarge contrib"
sudo cd /root
sudo wget https://download.webmin.com/jcameron-key.asc
sudo cat jcameron-key.asc | gpg --dearmor >/etc/apt/trusted.gpg.d/jcameron-key.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install webmin

  echo ""
  echo "###############################################"
  echo "    Navigate to your server hostname / IP address on port 10000 and sign in with your linux account"
  echo "###############################################"
  echo ""
  sleep 3s

