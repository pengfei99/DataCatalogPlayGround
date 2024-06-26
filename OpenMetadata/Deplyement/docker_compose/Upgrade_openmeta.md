# Upgrade openmetadata to latest version

You can get the latest release from [here](https://github.com/open-metadata/OpenMetadata/releases)

## Stop current service and backup the data

All OM metadata is stored inside a database(e.g. mysql or postgres).

The data model(table names, schemas,...) is managed using [Flyway migrations](https://flywaydb.org/).
The structure of this data model can change. This means that the shape of the database is tightly coupled to your OpenMetadata Server version.
If a database migration is needed to upgrade the `OpenMetadata app`, you should find the migration scripts which handles
the migration [here](https://github.com/open-metadata/OpenMetadata/tree/main/bootstrap/sql).

## Clean the existing deployment

```shell
# --rmi all Remove all images
# -v Remove the named volumes declared in the volumes section of docker-compose.yml and the anonymous volumes attached to the container
# --remove-orphans Remove containers not defined in docker-compose.yml
docker-compose -f docker-compose.yml down --rmi all -v --remove-orphans
```
