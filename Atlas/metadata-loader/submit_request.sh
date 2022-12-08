#!/bin/bash

oidc_token="eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJhUHNCSzhYRC1od1gtMWJFbjdZZDRLS0tWS0hYRy03RHg3STZDaVZZWUtRIn0.eyJleHAiOjE2NzEwODg1ODksImlhdCI6MTY3MDQ4Mzc5NywiYXV0aF90aW1lIjoxNjcwNDgzNzg5LCJqdGkiOiIyYmQ2MjYzYS01ODg5LTRjOTMtODkyYy0zZDc1ZTFiOThhNWIiLCJpc3MiOiJodHRwczovL2F1dGgubGFiLnNzcGNsb3VkLmZyL2F1dGgvcmVhbG1zL3NzcGNsb3VkIiwiYXVkIjpbIm1pbmlvLWRhdGFub2RlIiwib255eGlhIiwiYWNjb3VudCJdLCJzdWIiOiI0NzM0OTEyOC00YTRjLTQyMjYtYTViMS02ODA4MDFhZjVhMmIiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJvbnl4aWEiLCJub25jZSI6IjlhMmM4MjhiLWQ5MjEtNGQzZC04N2Q1LTQ2ZTRhNjc3MTM3YiIsInNlc3Npb25fc3RhdGUiOiIwOGExM2FkNC05MDg4LTRiNmUtYTU1MC0yNzM0MzY1MmI2MTMiLCJhbGxvd2VkLW9yaWdpbnMiOlsiKiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsiQXRsYXNfcm9sZV9hZG1pbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZ3JvdXBzIGVtYWlsIiwic2lkIjoiMDhhMTNhZDQtOTA4OC00YjZlLWE1NTAtMjczNDM2NTJiNjEzIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5hbWUiOiJQZW5nZmVpIExpdSIsImdyb3VwcyI6WyJmb3JtYXRpb24iLCJoYWNrYXRob24tdW4tMjAyMiIsIm9ueXhpYSIsInBvYy1haWRhIiwicmVsZXZhbmMiLCJzcGFyay1sYWIiLCJzc3BjbG91ZC1hZG1pbiIsInZ0bCJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJwZW5nZmVpIiwiZ2l2ZW5fbmFtZSI6IlBlbmdmZWkiLCJsb2NhbGUiOiJmciIsImZhbWlseV9uYW1lIjoiTGl1IiwiZW1haWwiOiJsaXUucGVuZ2ZlaUBob3RtYWlsLmZyIiwicG9saWN5Ijoic3Rzb25seSJ9.UlHHpafQtwyvbrMiM5S4WhnxhZtkpvGhlCixOiOrKvTpiT_UHxT_UWcICAOEkQwzNM5XKJ5r0mWzCRcXdhgPFtN-toHkDjhuWGygHx8a5byjqeU6nrUJmH4UT_DfDTk-Y8mZMIFf82VxhySn4Lb7cn4Rh92iCty42dKrVMulC4v_ya-8ODSxPhX6SZubAPAp1BjU5uJ45p3Jj0Ny5a7_y2LnrqUwnjrEEn2Y5WJ1RRJXKxjbSq7mRSYP_H57zRtHjnaHcAkO5l5vMy0E-GiF6J-FMQBp8yJPk6Ug88Vl2Ccxam7BSGYatLCqhItH8Px8RCRpil_edEj1HvP6m9WBbA"

# url="https://atlas.lab.sspcloud.fr/api/atlas"
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
# -H "Authorization: Bearer ${oidc_token}" "$url2/search/basic" -d '@./metadata_source/searchCondClassification.json'


# get all entities of type hive_table
# curl -iv -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entities?type=hive_table"

# get all entities of type hive_process
# curl -iv -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entities?type=hive_process"


# get details of an entity by its guid
# guid for test2 e1a3fb3c-321e-4441-b147-d1e5fde32021
# guid for test c5ee6a58-d381-483f-9794-6f511d79cacf
# guid for hive_process1 "ca5cc018-0893-4eb6-9a76-248833ee3a5f"
# guid for hive_process2 "e207f6f5-3470-4cdf-b073-7251ae0571a3"
# guid="ca5cc018-0893-4eb6-9a76-248833ee3a5f"
# curl -iv -X GET -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/entity/guid/${guid}"

############################## Insert example ############################################################
# upload the typedefs in the json file
# curl -iv -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedefs" -d "@./metadata_source/typedef_dcat_dataset.json"

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

################################ Delete example ######################################################
curl -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url2/types/typedef/name/pengfei_script" 

