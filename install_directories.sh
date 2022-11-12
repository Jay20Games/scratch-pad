mkdir /data
mkdir /data/{torrents,usenet,media,configs}
mkdir /data/torrents/{tv,movies,music}
mkdir /data/usenet/{tv,movies,music}
mkdir /data/media/{tv,movies,music}

sudo chown -R $USER:$USER /data
sudo chmod -R a=,a+rX,u+w,g+w /data
