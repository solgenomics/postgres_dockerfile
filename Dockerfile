FROM postgres:12.3

ENV POSTGRES_PASSWORD=postgres

RUN wget https://github.com/solgenomics/sgn/blob/master/t/data/fixture/empty_fixture.sql

ADD run.sh /docker-entrypoint-initdb.d
