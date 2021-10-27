set IMAGE=postgres-tds-cron
set NAME=postgres
set LOCAL_PORT=5432

docker rm -f %NAME%
docker run --name %NAME% -itd --restart always ^
  --publish %LOCAL_PORT%:5432 ^
  --env PG_PASSWORD=password ^
  --env DB_USER=hernad ^
  --env DB_PASS=hernad ^
  --env DB_NAME=db1,db2 ^
  --volume postgresql-data:/var/lib/postgresql ^
  %IMAGE%

docker logs  -f %NAME%