FROM postgres:11.4

ENV POSTGRES_PASSWORD=postgres
    
ADD sql /docker-entrypoint-initdb.d/
