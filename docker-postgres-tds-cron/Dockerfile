# postgresql docker source https://github.com/sameersbn/docker-postgresql/blob/master/Dockerfile
# mssql wrapper https://github.com/TheRevenantStar/tds_fdw/blob/fbe1f68295b845b099395340a9e63a2a8fdbbdaa/InstallUbuntu.md

FROM sameersbn/postgresql:10-2
LABEL maintainer="bjasko@bring.out.ba"
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
       postgresql-contrib libsybdb5 freetds-dev freetds-common \
       wget build-essential libpq-dev postgresql-server-dev-10 postgresql-10-cron \
       clang-6.0
# mssql wrapper install
ARG  TDS_FDW_BUILD=1.0.8

# ovi paketi "bune" tds_fdw build - prave se paketi za postgresql-14 a zelimo 10
RUN apt remove -y postgresql-14 postgresql-client-14
RUN wget https://github.com/tds-fdw/tds_fdw/archive/v$TDS_FDW_BUILD.tar.gz -P /tmp
RUN tar xvfz  /tmp/v$TDS_FDW_BUILD.tar.gz -C /tmp
#CPPFLAGS=-I/usr/include/postgresql/10/server 
RUN cd  /tmp/tds_fdw-$TDS_FDW_BUILD && make USE_PGXS=1 &&  sudo make USE_PGXS=1 install

COPY runtime/ ${PG_APP_HOME}/
COPY entrypoint.sh /sbin/entrypoint.sh
RUN chmod 755 /sbin/entrypoint.sh

EXPOSE 5432/tcp
VOLUME ["${PG_HOME}", "${PG_RUNDIR}"]
WORKDIR ${PG_HOME}
ENTRYPOINT ["/sbin/entrypoint.sh"]
