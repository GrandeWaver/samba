##Komendy z pilku commands.txt

## PRZYDATNE:
net use * /delete

KOK 1:
- założenie konta Digital Dcean
KOK 2:
- zbudowanie dropletu
- dodanie pamięci
KROK 3: 
- konfiguracja:

POLECENIA:
sudo apt-get update
sudo apt-get upgrade --yes
sudo apt install samba --yes
systemctl status smbd --no-pager -l
sudo systemctl enable --now smbd
sudo ufw allow samba

sudo mkdir /samba
sudo mkdir /samba/dysk
sudo nano /etc/samba/smb.conf

[global]
obey pam restrictions = no

[dysk]
comment = Dysk udostępniony pracownikom
path = /samba/dysk
read only = no
writable = yes
browseable = yes
guest ok = no
map hidden = yes
hide unreadable = yes
hide unwriteable files = yes
create mask = 0755
# jeśli user może usunąc folder: create mask = 0775
force create mode = 0770
directory mask = 0770
force directory mode = 0770
force group = pracownicy

# szybki check
testparm
# restart
sudo systemctl restart smbd


# ROOT
sudo smbpasswd -a root
> hasło
mkdir /samba/dysk/root
chmod 700 /samba/dysk/root

# FOLDER DLA WSZYSTKICH
sudo mkdir /samba/dysk/udostępnione
chmod 755 /samba/dysk/udostępnione
chmod -R 777 /samba/dysk/udostępnione/

#GRUPA pracownicy
groupadd pracownicy

# PORACOWNIK1
sudo adduser pracownik1
> hasło
sudo smbpasswd -a pracownik1
> hasło

mkdir /samba/dysk/pracownik1
chown pracownik1 /samba/dysk/pracownik1
chmod 770 /samba/dysk/pracownik1
chown -hR pracownik1 /samba/dysk/pracownik1
sudo usermod -a -G pracownicy root


