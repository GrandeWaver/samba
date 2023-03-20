#!/bin/bash
sudo apt install samba --yes
systemctl status smbd --no-pager -l
sudo systemctl enable --now smbd
sudo ufw allow samba
