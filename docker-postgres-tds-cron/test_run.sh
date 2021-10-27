docker rm -f postgresql-tds
docker run --name postgresql-tds -itd --restart always \
  --publish 54325:5432 \
  --volume postgresql-data:/var/lib/postgresql \
  tds-fdw
