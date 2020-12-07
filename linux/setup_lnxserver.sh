su vagrant

sudo apt update

# Setup ssh access from fleet
cat /home/vagrant/.ssh/lnx_rsa.pub >> /home/vagrant/.ssh/authorized_keys
echo '10.16.2.25 fleet.local fleet.local' | sudo tee -a /etc/hosts

# Install docker
sudo apt -y install docker.io
sudo usermod -aG docker vagrant

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.26.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install
curl https://raw.githubusercontent.com/WebGoat/WebGoat/develop/docker-compose.yml | docker-compose -f - up -d
