FROM postgres:12

ENV POSTGRES_PASSWORD=postgres

ADD sql /docker-entrypoint-initdb.d/
