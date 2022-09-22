echo "update package manager and install packages"

sudo apt-get -y update && sudo apt-get -y upgrade

sudo apt-get -y install \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

echo "add Docker’s official GPG key"

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo "use the following command to set up the repository"

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

echo "install Docker"

sudo apt-get -y update
sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin

echo "verify that Docker Engine is installed correctly"

sudo service docker start
sudo docker version
sudo usermod -aG docker ${USER}

sudo docker run hello-world
# if it occurs the following error:
# Got permission denied while trying to connect to the Docker daemon socket at unix:///var/run/docker.sock: Get  http://%2Fvar%2Frun%2Fdocker.sock/v1.40/containers/json: dial unix /var/run/docker.sock: connect: permission denied
# sudo usermod -aG docker ${USER}

sudo docker rmi -f hello-world

echo 'check docker-compose'

sudo docker compose --version

echo '''version: "3"
services:
  just_a_test:
    image: hello-world
''' > docker-compose.yaml
sudo docker compose up

rm -f docker-compose.yaml

sudo apt-get -y autoremove
