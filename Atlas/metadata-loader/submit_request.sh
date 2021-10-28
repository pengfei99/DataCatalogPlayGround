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
curl -iv -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entities?type=hive_table"


############################## Insert example ############################################################
# upload the typedefs in the json file
# curl -iv -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./typedef-node.json"

# ok
# curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./typedef-file.json"

# ok
# curl -negotiate -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./typedef-kafka_with_schema.json"

# failed
# curl -iv -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/types/typedefs" -d "@./typedef-python_process.json"

# failed
# curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entity/bulk" -d "@./infrastructure-entities.json"

# failed
# curl -negotiate -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entity/bulk" -d "@./news-ingestion-dataset.json"

# 
# curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entity/bulk" -d "@./news-ingestion-process.json"

