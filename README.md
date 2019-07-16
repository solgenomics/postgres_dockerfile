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
