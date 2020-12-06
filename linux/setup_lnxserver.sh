cat /home/vagrant/.ssh/lnx_rsa.pub >> /home/vagrant/.ssh/authorized_keys
echo '10.16.2.25 fleet.local fleet.local' | sudo tee -a /etc/hosts
