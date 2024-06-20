# Deploy openmetadata with docker compose

You can find the official docs [here](https://docs.open-metadata.org/v1.4.x/deployment/docker).

We suppose you already have the `docker(version 20.10.0 or higher) and docker compose(version 2.2.3 or higher)` on 
your server. You can use the below command to check

```shell
docker --version
docker compose version
```

## Architecture overview 

Hardware requirements

We recommend you to have a server(vm) which has `8core and 16GB memory`

## run the docker compose with custom env var

```shell
sudo docker compose -f docker-compose-postgres.yml --env-file jwt.env up -d
```

## ingest data