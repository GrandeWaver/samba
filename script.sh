#!/bin/bash
systemctl status smbd --no-pager -l
sudo systemctl enable --now smbd
sudo ufw allow samba
