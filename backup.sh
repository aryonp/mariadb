#/bin/bash

UNAME="my_user"
PASS="my_pass"
HNAME=hostname -h

ARC_PATH="store_bu"
ARC_FILE="$HNAME_db_`date +%F_%H-%M-%S`.tar.gz"
ARC_DAYS="30"

cd $ARC_PATH
 
for database in `sudo mysql -u $UNAME -p"$PASS" -Bse 'show databases'`; do
  if [ "phpmyadmin" == "$database" ]; then continue; fi
  if [ "performance_schema" == "$database" ]; then continue; fi
  if [ "information_schema" == "$database" ]; then continue; fi
  sudo mysqldump -u $UNAME -p"$PASS" --events $database > $database.sql
 
done

sudo tar -czvf $ARC_FILE *.sql
sudo rm -rf *.sql
sudo find . -mtime +$ARC_DAYS -exec rm {} \;
