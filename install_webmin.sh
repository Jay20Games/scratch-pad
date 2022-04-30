sudo cd /root
sudo wget https://download.webmin.com/jcameron-key.asc
sudo cat jcameron-key.asc | gpg --dearmor >/etc/apt/trusted.gpg.d/jcameron-key.gpg
sudo apt-add-repository "deb https://download.webmin.com/download/repository sarge contrib"
sudo apt install apt-transport-https
sudo apt update
sudo apt install webmin
