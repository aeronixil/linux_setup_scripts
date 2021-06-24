#runs automation setup script

#update repository files
sudo apt update

#upgrade all apps
sudo apt upgrade -y

#uninstall docker if it is installed
sudo apt-get purge docker-ce docker-ce-cli containerd.io -y
sudo rm -rf /var/lib/docker
sudo rm -rf /var/lib/containerd


#installing docker
 sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

echo \
  "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
sudo apt-get install docker-ce docker-ce-cli containerd.io 
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
sudo systemctl start docker
sudo docker run hello-world




echo "DOCKER ENGINE IS INSTALLED SUCSESSFULLY"
echo "now installing docker-compose"

#installing docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version
echo "DOCKER-COMPOSE IS INSTALLED" 





