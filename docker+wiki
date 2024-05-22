apt-get install docker.io docker-compose
systemctl enable --now docker.service
nano ~/wiki.yml
 CONTAINER (wiki.yml)
  P.S.
После первоначальной настройки через Web-интерфейс с CLI загрузите LocalSettings.php в тот же каталог, что и эта wiki.yml и раскомментируйте следующую строку 
"# - ./LocalSettings.php:/var/www/html/LocalSettings.php" и используйте docker-compose для перезапуска службы mediawiki
docker volume create dbvolume
docker-compose -f wiki.yml up -d
#CLI:
sudo echo 10.4.4.26 mediawiki.demo.vxstp mediawiki >> /etc/hosts
open in browser mediawiki.demo.vxstp:8080
-------------
host - db
name - mediawiki
user bd - wiki
passwd - DEP@ssw0rd
# after setup, download localsettings and mv to hq-srv ~/ next step, open wiki yml und uncomm second string in volumes
reboot docker service
docker-compose -f wiki.yml stop
docker-compose -f wiki.yml up-d

