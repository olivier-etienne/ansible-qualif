#!/bin/sh
#sudo mount -t nfs 10.185.110.178:/volume1/NetBackup/ /mnt/nas
#check /etc/fstab for mount point details

######################################
# Clean previous logs
rm /var/log/saveToNas/*.bak
cd /var/log/saveToNas/
rename s/.log/.bak/ *.log

######################################
# Save to the NAS via rsync
dpkg -l > /home/qualif/Bureau/SAVE_TO_NAS/installed_packages
crontab -u qualif -l > /home/qualif/Bureau/SAVE_TO_NAS/crontab_qualif
crontab -l > /home/qualif/Bureau/SAVE_TO_NAS/crontab_root

rsync -av --force --del /home/qualif/Bureau/ /mnt/nas/banc_debug/home/qualif/Bureau/  --log-file /var/log/saveToNas/job1.log 
rc1=$?

rsync -av --force --del /var/nas/ /mnt/nas/banc_debug/var/nas/  --log-file /var/log/saveToNas/job2.log
rc2=$?

rsync -av --force --del --exclude 'builds' /var/lib/jenkins/ /mnt/nas/banc_debug/var/lib/jenkins/  --log-file /var/log/saveToNas/job3.log
rc3=$?

rsync -av --force --del /etc/ /mnt/nas/banc_debug/etc/  --log-file /var/log/saveToNas/job4.log
rc4=$?

rsync -av --force --del --include='./index.php' --include='./test' --include='./test/*' --include='./img' --include='./img/*' --include='./dashboard' --exclude='*' /var/www/ /mnt/nas/banc_debug/var/www/ --log-file /var/log/saveToNas/job5.log
rc5=$?

rc=$(($rc1 + $rc2 + $rc3 + $rc4 + $rc5))
if [ $rc != 0 ] ; then
   echo "Erreur pendant le backup du banc de debug. Plus de details dans /var/log/saveToNas/jobs*.log" > /var/log/saveToNas/status.log

   if [ $rc1 != 0 ] ; then
       echo "\nstatus = $rc1" >> /var/log/saveToNas/job1.log
       cat /var/log/saveToNas/job1.log | mail -s 'BACKUP DEBUG WARNING' archilog.newtv@orange.com
   fi
   if [ $rc2 != 0 ] ; then
       echo "\nstatus = $rc2" >> /var/log/saveToNas/job2.log
       cat /var/log/saveToNas/job2.log | mail -s 'BACKUP DEBUG WARNING' archilog.newtv@orange.com
   fi
   if [ $rc3 != 0 ] ; then
       echo "\nstatus = $rc3" >> /var/log/saveToNas/job3.log
       cat /var/log/saveToNas/job3.log | mail -s 'BACKUP DEBUG WARNING' archilog.newtv@orange.com
   fi
   if [ $rc4 != 0 ] ; then
       echo "\nstatus = $rc4" >> /var/log/saveToNas/job4.log
       cat /var/log/saveToNas/job4.log | mail -s 'BACKUP DEBUG WARNING' archilog.newtv@orange.com
   fi
   if [ $rc5 != 0 ] ; then
       echo "\nstatus = $rc5" >> /var/log/saveToNas/job5.log
       cat /var/log/saveToNas/job5.log | mail -s 'BACKUP QUALIF WARNING' archilog.newtv@orange.com
   fi
else
   echo "Success" > /var/log/saveToNas/status.log
fi
