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
#### Database
The database itself is named `breedbase` and contains a number of schemas within it.

#### Default username/password:
```
username: postgres
password: postgres
```

#### Connecting Breedbase running in Docker
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

#### Connecting Breedbase with User Defined Networks
A better method to facilitate inter-container communication is user-defined networks.
A full description can be found in the Docker documentation here: [docker user defined networks](https://docs.docker.com/network/)

First create a network, then add the containers.  The docker postgres container name from above is breedbase_db.
Assume you have created a breedbase web container named breedbase_web.  At the command line, run the following commands:
                                                 
  ```
 docker network create -d bridge bb_bridge_network
 docker network connect bb_bridge_network breedbase_db
 docker network connect bb_bridge_network breedbase_web
  ```
  
 From within a container, you can access other containers in the same network by invoking the container name.  For example,
 to access the breedbase postgres database installed in this docker, the breedbase_web container would
 use "breedbase_db" as the "host".
 