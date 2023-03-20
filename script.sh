#!/bin/bash
sudo apt-get update
sudo apt-get upgrade
sudo apt install samba
systemctl status smbd --no-pager -l
sudo systemctl enable --now smbd
sudo ufw allow samba
