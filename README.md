# scratch-pad

## vbox guest additions:
1. Start VirtualBox.
2. Start the host in question.
3. Once the host has booted, click Devices | Insert Guest Additions CD Image.
4. Log in to your guest server.
5. Mount the CD-ROM with the command sudo mount /dev/cdrom /media/cdrom.
6. Change into the mounted directory with the command cd /media/cdrom.
7. Install the necessary dependencies with the command sudo apt-get install -y dkms build-essential linux-headers-generic linux-headers-$(uname -r)
8. Change to the root user with the command sudo su.
9. Install the Guest Additions package with the command ./VBoxLinuxAdditions.run.
10. Allow the installation to complete.

## vbox page fusion:
```
VBoxManage modifyvm "VM name" --page-fusion on
```
## hyper-v LIS
```
echo 'hv_vmbus' >> /etc/initramfs-tools/modules
echo 'hv_storvsc' >> /etc/initramfs-tools/modules
echo 'hv_blkvsc' >> /etc/initramfs-tools/modules
echo 'hv_netvsc' >> /etc/initramfs-tools/modules
```
```
apt update && apt -y upgrade
apt -y install linux-virtual linux-cloud-tools-virtual linux-tools-virtual
update-initramfs -u
reboot
```
```
lsmod | grep hv
```
## docker and compose install:
```
curl https://get.docker.com | sh
```
```
usermod -aG docker amp
```
## webmin:
```
curl -o setup-repos.sh https://raw.githubusercontent.com/webmin/webmin/master/setup-repos.sh
sh setup-repos.sh
```
```
apt-get install --install-recommends webmin
```
## ctop
docker run --rm -ti \
  --name=ctop \
  --volume /var/run/docker.sock:/var/run/docker.sock:ro \
  quay.io/vektorlab/ctop:latest
  
## netdata

## netbird

## fail2ban
```
apt install fail2ban
```
## disable ipv6 in grub
https://itsfoss.com/disable-ipv6-ubuntu-linux/

## portainer host and agent:
[https://docs.portainer.io/start/install](https://docs.portainer.io/start/install-ce)

## ansible
TO INSTALL ANSIBLE: apt install ansible

https://www.digitalocean.com/community/tutorials/how-to-install-and-configure-ansible-on-ubuntu-22-04

## nginx proxy manager:
https://nginxproxymanager.com/setup/#running-the-app

## firewall commands:
https://www.digitalocean.com/community/tutorials/ufw-essentials-common-firewall-rules-and-commands

ufw allow in on wt0

## online yaml parser:
https://yaml-online-parser.appspot.com/

## composerize:
https://www.composerize.com/

## iscsi setup
https://www.informaticar.net/ubuntu-20-04-how-to-setup-iscsi-initiator/

https://www.truenas.com/docs/scale/scaletutorials/shares/iscsi/

## timesyncd
timedatectl set-ntp no

apt install ntp

reboot

ntpq -p

## Valheim
apt install libpulse-dev libatomic1 libc6

## VMDK
VBoxManage.exe createmedium disk --filename C:\VBoxVMs\first\sg6\raw1.vmdk --format=VMDK --variant RawDisk --property RawDrive=\\.\PhysicalDrive1

attributes disk clear readonly
