sudo apt update
sudo apt upgrade -y
sudo apt install samba
systemctl status smbd --no-pager -l
sudo systemctl enable --now smbd
sudo ufw allow samba
