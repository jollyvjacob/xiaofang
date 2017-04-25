#!/bin/sh

source /tmp/www/cgi-bin/commands/sampleSystem.sh 

mkdir -p /media/mmcblk0p2/data/var/spool/cron/crontabs
echo "* * * * * /tmp/www/cgi-bin/commands/sampleSystem.sh" >> /media/mmcblk0p2/data/var/spool/cron/crontabs/root
crond -l 0 -L /var/log/crond  -c /media/mmcblk0p2/data/var/spool/cron/crontabs
