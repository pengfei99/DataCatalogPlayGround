# Deploy a datahub instance

```shell
cd /home/onyxia/work/DataCatalogPlayGround/Datahub/demo

# install dependent services
helm install prerequisites datahub/datahub-prerequisites --values pre_values.yaml

# install datahub
helm install datahub datahub/datahub --values datahub_values.yaml
```

# Insert metadata

```shell
# ingest covid data
cd /home/onyxia/work/DataCatalogPlayGround/Datahub/metadata-loader/file

datahub ingest -c local_file_to_datahub_kafka.yaml 

# ingest postgres data

cd /home/onyxia/work/DataCatalogPlayGround/Datahub/metadata-loader/postgresql

datahub ingest -c postgres_to_datahub.yaml
```

# View intra metadata

postgres tables

# View data lineage
bigquery-public-data>covid19_public_forecasts>county_14d