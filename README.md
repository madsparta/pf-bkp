# pf_bkp.sh

Perform backup configuration of several pfSense firewall with SSH access.

Script [pf_bkp.sh](pf_bkp.sh) require a list as argument, list need have firewall address and SSH port.

> firewalladdress.com:SSHport

After download configuration file (`/cf/conf/config.xml`), the backup file is stored on following path.

> ./fw_backup/bkp_$date-$hours/$firewall/config.xml

Just run to perform backup of firewall list.

> ./pf_bkp.sh firewalls.txt
***
