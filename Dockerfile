FROM postgres:12.3

ENV POSTGRES_PASSWORD=postgres
ADD run.sh /docker-entrypoint-initdb.d
ADD sql /docker-entrypoint-initdb.d/

