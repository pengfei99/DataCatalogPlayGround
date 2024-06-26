# Deploy openmetadata with docker compose

You can find the official docs [here](https://docs.open-metadata.org/v1.4.x/deployment/docker).

We suppose you already have the `docker(version 20.10.0 or higher) and docker compose(version 2.2.3 or higher)` on 
your server. You can use the below command to check

```shell
docker --version
docker compose version
```

## 1. Architecture overview 

The docker compose spec of the openmetadata(OM) will create four containers:
- OM web app : requires 2vcore and 6GiB
- database(postgres or mysql) : 2 vcore and 4GiB memory and 100GiB storage volume
- elasticsearch: 2 vcore and 4GiB memory and 30GiB storage volume
- ingestion server(airflow, OM python packages): 2 vcore and 4GiB memory and 10GiB storage volume

Below figures shows which port the services will be exposed
![om_docker_architecture.png](../../../img/om_docker_architecture.png)


> To run the docker compose, we recommend you to have a server(vm) which has `8vcore, 20GiB memory and 200GiB` for 
> minimum running.

## 2. Deployment steps

### 2.1 Get the docker compose file

You can download the `Docker Compose files` from the [Releases](https://github.com/open-metadata/OpenMetadata/releases/).

Currently,(20/06/2024), you should find four docker compose file in the release assets:
- **docker-compose-openmetadata.yml**: contains only two docker compose services: `openMetadata-server` and `execute-migrate-all`
- **docker-compose-ingestion.yml**: contains only one compose service: `ingestion`
- **docker-compose.yml**: contains five services: `mysql`, `elasticsearch`,`ingestion`,`openMetadata-server` and `execute-migrate-all`
- **docker-compose-postgres.yml**: contains five services: `postgres`, `elasticsearch`,`ingestion`,`openMetadata-server` and `execute-migrate-all`

> We recommend you to use **docker-compose-postgres**, because postgres has fewer issues than mysql

You can also run the below command to fetch the docker compose file directly from the terminal

```shell
mkdir /opt/openmetadata-docker && cd /opt/openmetadata-docker
# get the OM 1.4.1 
wget wget https://github.com/open-metadata/OpenMetadata/releases/download/1.4.1-release/docker-compose-postgres.yml
```


### First run with default config

The below command will run the docker compose file with default config

```shell
sudo docker compose -f docker-compose-postgres.yml
```

Normally you should see the output of the docker compose in the terminal. If everything works well, the server should 
run at `localhost:8585`. Test it with the below command

```shell
curl http://localhost:8585
```


### 2.2 Custom the config

Run the docker compose with custom config. As we mentioned before, all the config template in OM is in `yaml format`.

For example, the below code shows the db config section in the `docker-compose-postgres.yml`.

```yaml
#Database configuration for postgresql
DB_DRIVER_CLASS: ${DB_DRIVER_CLASS:-org.postgresql.Driver}
DB_SCHEME: ${DB_SCHEME:-postgresql}
DB_PARAMS: ${DB_PARAMS:-allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC}
DB_USER: ${DB_USER:-openmetadata_user}
DB_USER_PASSWORD: ${DB_USER_PASSWORD:-openmetadata_password}
DB_HOST: ${DB_HOST:-postgresql}
DB_PORT: ${DB_PORT:-5432}
OM_DATABASE: ${OM_DATABASE:-openmetadata_db}
```

**DB_USER**: is the variable in the config file

**${DB_USER:-openmetadata_user}**: is the value of the variable. it has two parts, before `:-` the `DB_USER` means it takes
the value env var `DB_USER`, after `:-` the `openmetadata_user` is the default value if the env var `DB_USER` is not
defined.

So the best way to custom the config is to create a new env file which stores the custom values of the env var. Then
apply the file with the docker compose command.

For example, if we want to overwrite the default db config in the docker compose file, we can add the below line in
the `custom-conf.env` file

```yaml
# Database configuration for MySQL to overwrite the default postgres config
DB_DRIVER_CLASS="com.mysql.cj.jdbc.Driver"
DB_SCHEME="mysql"
DB_PARAMS="allowPublicKeyRetrieval=true&useSSL=true&serverTimezone=UTC"
DB_USER="mysql_user"
DB_USER_PASSWORD="mysql_pwd"
DB_HOST="10.50.100.88"
DB_PORT="3306"
OM_DATABASE="mydb"
```

Below command show how to run a docker compose file with custom env var values
```shell
sudo docker compose -f docker-compose-postgres.yml --env-file custom-conf.env up -d
```

> the `-d` option means run the docker compose in mode detach.
 
### 2.3 Test the server

The default login/pwd for the OM server is `admin:admin`. You should change this after your first login

## 3. Prepare for production deployment, enable the minimum security

With the above minimum config, you only have an instance for development and testing. It should never be used in production.

Because, it uses a default `PKI key pair` for generating the `JWT tokens`. And the admin login and password is delivered
with the docker compose file.

Follow the tutorial in section `security` to change the default security settings.


