# postgres_dockerfile
Dockerfile for breeDBase Postgresql instance.  This image is based on the postgres Docker image (https://hub.docker.com/_/postgres)

### Install docker (on Debian/Ubuntu)
```bash
apt-get install docker-ce
```
### Clone the repo
```bash
git clone https://github.com/solgenomics/postgres_dockerfile
```
### Build the image
```bash
docker build -t breedbase_db postgres_dockerfile
```
### Run the container
To run the image:
```bash
docker run -d --name breedbase_db -p 5432:5432 breedbase_db
```

Because this image is an extension of the [postgres Docker image](https://hub.docker.com/_/postgres), you can pass in the environment variables defined by that image.  You can also mount the data directory to the host for persistent storage: 
```
-v /my/own/datadir:/var/lib/postgresql/data
```

### Logistics
####Database
The database itself is named `breedbase` and contains a number of schemas within it.

####Default username/password:
```
username: postgres
password: postgres
```

####Connecting Breedbase running in Docker
If you are using `docker run`, then an easy (although deprecated) way to facilitate inter-container communications is to make use of the `--link` directive.  To do so for Breedbase:
1. Create a database container (see instructions above)
1. Update local sgn_local.conf file:
   ```
   ...
   dbhost db
   ...
   ```
1. Create a breedbase container<br>*NOTE: add the `--link` parameter to the `docker run` command, ex:
    ```
    docker run -d -p 8080:8080 -v /path/to/sgn_local.conf:/home/production/cxgn/sgn/sgn_local.conf --link <name of breedbase db container>:db --name breedbase breedbase/breedbase:latest
    ``` 