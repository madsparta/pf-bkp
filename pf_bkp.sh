#!/usr/bin/env bash
t=$(date +%Y%m%d-%H%M%S)

getxml () {
    x=$1
    pfsense=${x%%:*}
    port=${x##*:}
    dir='./fw_backup/bkp_'$t'/'$pfsense''
    logfile=''$dir'/.log.pf-bkp'
    
    mkdir -p "$dir" &>/dev/null &&
    scp -P "$port" -q -o PasswordAuthentication=no -o StrictHostKeyChecking=no -o ConnectTimeout=5 root@"$pfsense":/cf/conf/config.xml "$dir" && 
    echo "[$(date)] Backup on firewall $pfsense OK." >> "$logfile" ||
    echo "[$(date)] Backup fail on firewall $pfsense." >> "$logfile"
}

[[ -f "$1" ]] &&
for fw in $(cat $1); do
    getxml "$fw"
done
