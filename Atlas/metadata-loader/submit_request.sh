#!/bin/bash

oidc_token=""

url="https://atlas.lab.sspcloud.fr/api/atlas"
url2="https://atlas.lab.sspcloud.fr/api/atlas/v2"

########################################### Purge example #################################################

# All the entities that you deleted by using the Atlas frontend are not really deleted, Atlas just set their status as deleted.
# They are still in the database. To purge them completely, you need to use the following command
# You need to replace the last two uid by the uid of the entity that you want to delete.

#curl -X PUT "${url}/admin/purge/" \
#-H 'Content-Type: application/json' \
#-H 'Accept: application/json' \
#-H "Authorization: Bearer ${oidc_token}" \
#-d '["b9355eab-bbf5-4cd6-b711-12f85a3e9d01", "9fed31f5-0a27-40dc-ba97-96d153fc297b"]'

########################################### Search example #################################################
# curl -iv -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' \
# -H "Authorization: Bearer ${oidc_token}" "$url/search/basic" -d '@./metadata_source/searchCond.json'


# get all entities of type hive_table
# curl -iv -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entities?type=hive_table"

# get all entities of type hive_process
# curl -iv -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entities?type=hive_process"


# get details of an entity by its guid
# guid for test2 e1a3fb3c-321e-4441-b147-d1e5fde32021
# guid for test c5ee6a58-d381-483f-9794-6f511d79cacf
# guid for hive_process1 "ca5cc018-0893-4eb6-9a76-248833ee3a5f"
# guid for hive_process2 "e207f6f5-3470-4cdf-b073-7251ae0571a3"
guid="ca5cc018-0893-4eb6-9a76-248833ee3a5f"
curl -iv -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/entity/guid/${guid}"

############################## Insert example ############################################################
# upload the typedefs in the json file
# curl -iv -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./metadata_source/typedef-node.json"

# ok
# curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./metadata_source/typedef-file.json"

# ok
# curl -negotiate -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./metadata_source/typedef-kafka_with_schema.json"

# ok
# curl -iv -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./metadata_source/typedef-python_process.json"

# ok
# curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/entity/bulk" -d "@./metadata_source/infrastructure-entities.json"

# ok
# curl -negotiate -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/entity/bulk" -d "@./metadata_source/news-ingestion-dataset.json"

# curl -negotiate -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/entity/bulk" -d "@./metadata_source/news-ingestion-process.json"


# ingest hive table/process
# curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/entity/bulk" -d "@./metadata_source/hive_table_entities_ingestion.json"

