НАСТРОЙКА НА HQ-SRV

![image](https://github.com/vxsetup/vxdemo/assets/146210764/cb4cb9db-e835-4248-9b23-d2021bedde91)

apt install samba krb5-user krb5-config winbind smbclient libpam-winbind libnss-winbind libpam-krb5 krb5-kdc -y

#Заходим в named.conf

![image](https://github.com/vxsetup/vxdemo/assets/146210764/65ac1bc4-7ba6-40f5-ab7c-06fc28d1cd9f)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/22181c59-3d55-4e57-b241-ef71d9516783)

#Останавливаем bind9

systemctl stop bind9

#bckup
cp /etc/samba/smb.conf /etc/samba/smb.conf.bak
УДАЛЯЕМ ПРЕЖНИЙ КОНФИГ

#Start domain install 

samba-tool domain provision

![image](https://github.com/vxsetup/vxdemo/assets/146210764/4e9b8da5-459b-4906-8d09-e7a7ed88f047)


#После настройки

![image](https://github.com/vxsetup/vxdemo/assets/146210764/ec73bfd3-cd18-4f61-a9b3-04a080174958)

![image](https://github.com/vxsetup/vxdemo/assets/146210764/61ed9e82-90fc-4ec5-8164-5c48589d5471)

#Reboot samba

systemctl restart samba-ad-dc
РЕБУТАЕМ СЕРВАК НАХЕР

named-checkconnf -z

#Проверяем работоспособность 

samba-tool domain info 127.0.0.1
kinit administrator

#Make users

Samba-tool user create Admin
Samba-tool user create Branch admin
Samba-tool user create Network admin

Samba-tool group create Admins
Samba-tool group create Network Admins
Samba-tool group create Branch Admins

Samba-tool group addmembes “Admins” “Admin”
Samba-tool group addmembers “Network admins” “Network admin”
Samba-tool group addmembers “Branch admins” “Branch admin”

#Проверяем 
wbinfo -u
wbinfo -g

#НАСТРОЙКА НА BR-SRV/CLI

Заходим в nano/etc/resolv.conf

domain branch.work
search demo.first
nameserver IP-HQSRV

#Устанавливаем для ввода в домен
apt install samba krb5-user krb5-config sssd sssd-tools libpam-sss libnss-sss adcli packagekit -y

#проверяем/входим в домен

realm join -u administrator demo.first
realm discover DEMO.FIRST

