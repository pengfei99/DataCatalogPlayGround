# Upload metadata to Datahub

Datahub provides a module that can send metadata to DataHub using Kafka or through the REST API. It can be used through our CLI tool, with an orchestrator like Airflow, or as a library.

You can find the official doc [here](https://datahubproject.io/docs/metadata-ingestion/)

## Install from PyPI
The folks over at Acryl Data maintain a PyPI package for DataHub metadata ingestion.

```shell
# Requires Python 3.6+
python3 -m pip install --upgrade pip wheel setuptools
python3 -m pip install --upgrade acryl-datahub
datahub version
# If you see "command not found", try running this instead: python3 -m datahub version
```

Note the core package does not has all dependencies to use all functionalities. For example, if you want use the connector for bigquery, postgres, datahub-rest, datahub-kafka
, you need to install them by using the following command

```shell
pip install 'acryl-datahub[bigquery,postgres,datahub-rest,datahub-kafka]'
```
## Write a metadata uploading script
Once, you have the python client installed. You can write a metadata loading script:

Example 1.(mysql_to_datahub.yaml) 
```yaml

source:
  type: mysql
  config:
    username: sa
    password: ${MySQL_PASSWORD}
    database: DemoData

transformers:
  - type: "fully-qualified-class-name-of-transformer"
    config:
      some_property: "some.value"

sink:
  type: "datahub-rest"
  config:
    server: "http://localhost:8080"
```
In example 1.

source:  that uses a mysql connector which can get the metadata from the mysql server
transformers: It can modify data before it reaches the ingestion sinks. For example, we can add additional owners or tags. you can use a transformer to write your own module and integrate it with DataHub.
sink: it indicates which datahub server and how (rest, kafka) the metadata will be uploaded to. In this example, we use rest


Example 2. (postgres_to_datahub.yaml)

```yaml
source:
  type: postgres
  config:
    # Coordinates
    host_port: postgresql-583865.user-pengfei.svc.cluster.local:5432
    database: 'amundsen_test'

    # Credentials
    username: 'pengfei'
    password: 'test'

    # Options
    database_alias: 'amundsen_test'

sink:
  type: "datahub-kafka"
  config:
    connection:
      bootstrap: "prerequisites-kafka.user-pengfei.svc.cluster.local:9092"
      schema_registry_url: "http://prerequisites-cp-schema-registry.user-pengfei.svc.cluster.local:8081"

```

In example 2, 

source: use a postgres connector that collect metadata from the postgresql server
sink: use kafka to upload data.

### Transformer is optional
You can notice the transformers is optional. In example 2, we don't have a transformer inside the metadata uploading script.


## Run the script

You can use below command to run the metauploading script

```shell
datahub ingest -c postgres_to_datahub.yaml
```
