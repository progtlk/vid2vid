#Thanks @dustinfreeman for providing the script
#Modified by Wallen Mphepo to work on Win 10

#Install docker-ce https://docs.docker.com/install/linux/docker-ce/ubuntu/#set-up-the-repository

######-----------COMMENTED OUT THIS BELOW SECTION SINCE DOCKER ALREADY INSTALLED ON MACHINE------------############

######-----------COMMENTED OUT THIS ABOVE SECTION SINCE DOCKER ALREADY INSTALLED ON MACHINE------------############

#Install nvidia-docker2 https://github.com/NVIDIA/nvidia-docker
# Add the package repositories
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | \
    sudo apt-key add -
distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | \
    sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update

sudo apt-get install -y nvidia-docker2
sudo pkill -SIGHUP dockerd


#NVIDIA drivers
#This triggers an interactive request to the user.
#Would love an alternative!
DEBIAN_FRONTEND=noninteractive
sudo apt-get install -y keyboard-configuration
sudo apt install -y ubuntu-drivers-common

apt-get install -y nvidia-384

#Reboot so the nvidia driver finishes install
sudo reboot


