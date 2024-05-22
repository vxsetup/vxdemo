#!/bin/bash

echo "Start backup!"

backup_dir="/etc/"
dest_dir="/opt/backup"

mkdir -p $dest_dir
tar -czf $dest_dir/$(hostname -s)-$(date +"%d.%m.%y").tgz $backup_dir

echo "Backup is done!"
