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
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"
echo "********************************************************"

echo "NOW INSTALLING NGINX PROXY MANAGER"

echo "making directory nginx_proxy_manager"
mkdir nginx_proxy_manager

echo "building docker-compose for nginx proxy manager inside nginx_proxy_manager directory"
cat nginx_docker_compose > nginx_proxy_manager/docker-compose

echo "running the docker compose file"
sudo nginx_proxy_manager/docker-compose up -d

echo "nginx proxy manager container and db container setup completed, please wait for 20 mins before accessing the web ui"

echo "nginx proxy manager installation complete"
echo "NOW INSTALLING PORTAINER "
echo "creating volume for portainer"
docker volume create portainer_data
echo "running portainer container"
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

echo"PORTAINER INSTALLATION COMPLETE"

echo "NOW INSTALLING NODE EXPORTER"
echo "creating a directory in /opt for node exporter"

mkdir /opt/node_exporter

echo "downloading node exporter"

wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz

echo "extracting tarball package"

tar xvfz node_exporter-1.2.2.linux-amd64.tar.gz
chmod +x node_exporter-1.2.2.linux-amd64
echo "please setup node exporter on auto reboot using this guide"
echo "https://timleland.com/how-to-run-a-linux-program-on-startup/"

















