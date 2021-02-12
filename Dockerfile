FROM postgres:12.3

ENV POSTGRES_PASSWORD=postgres

RUN  apt-get update
RUN  apt-get install -y wget
RUN  rm -rf /var/lib/apt/lists/*
RUN  wget https://raw.githubusercontent.com/solgenomics/sgn/master/t/data/fixture/empty_fixture.sql

ADD run.sh /docker-entrypoint-initdb.d/
