su vagrant

sudo apt update

# Install docker
sudo apt -y install docker.io
sudo usermod -aG docker vagrant 

# Install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.26.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Install ansible
sudo apt -y install ansible
ansible-galaxy install apolloclark.osquery

# Install winrm
sudo apt -y install python-pip
pip install pywinrm

# Configure fleet service
pushd fleet-osquery
mv * ../
popd
rm -r fleet-osquery
sudo mkdir -p /opt/fleet_logs
touch ~/.rnd
mkdir osquery
pushd osquery
openssl req -new -nodes -x509 -days 3650 -subj "/C=BR/ST=SP/L=SaoPaulo/O=CSC05/CN=fleet.local" -keyout fleet.key -out fleet.crt
popd
docker-compose -f docker-compose.yml up -d
