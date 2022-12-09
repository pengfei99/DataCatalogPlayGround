#!/usr/bin/bash

oidc_token="eyJhbGciOiJSUzI1NiIsInR5cCIgOiAiSldUIiwia2lkIiA6ICJhUHNCSzhYRC1od1gtMWJFbjdZZDRLS0tWS0hYRy03RHg3STZDaVZZWUtRIn0.eyJleHAiOjE2NzEwODg1ODksImlhdCI6MTY3MDQ4Mzc5NywiYXV0aF90aW1lIjoxNjcwNDgzNzg5LCJqdGkiOiIyYmQ2MjYzYS01ODg5LTRjOTMtODkyYy0zZDc1ZTFiOThhNWIiLCJpc3MiOiJodHRwczovL2F1dGgubGFiLnNzcGNsb3VkLmZyL2F1dGgvcmVhbG1zL3NzcGNsb3VkIiwiYXVkIjpbIm1pbmlvLWRhdGFub2RlIiwib255eGlhIiwiYWNjb3VudCJdLCJzdWIiOiI0NzM0OTEyOC00YTRjLTQyMjYtYTViMS02ODA4MDFhZjVhMmIiLCJ0eXAiOiJCZWFyZXIiLCJhenAiOiJvbnl4aWEiLCJub25jZSI6IjlhMmM4MjhiLWQ5MjEtNGQzZC04N2Q1LTQ2ZTRhNjc3MTM3YiIsInNlc3Npb25fc3RhdGUiOiIwOGExM2FkNC05MDg4LTRiNmUtYTU1MC0yNzM0MzY1MmI2MTMiLCJhbGxvd2VkLW9yaWdpbnMiOlsiKiJdLCJyZWFsbV9hY2Nlc3MiOnsicm9sZXMiOlsiQXRsYXNfcm9sZV9hZG1pbiJdfSwicmVzb3VyY2VfYWNjZXNzIjp7ImFjY291bnQiOnsicm9sZXMiOlsibWFuYWdlLWFjY291bnQiLCJtYW5hZ2UtYWNjb3VudC1saW5rcyIsInZpZXctcHJvZmlsZSJdfX0sInNjb3BlIjoib3BlbmlkIHByb2ZpbGUgZ3JvdXBzIGVtYWlsIiwic2lkIjoiMDhhMTNhZDQtOTA4OC00YjZlLWE1NTAtMjczNDM2NTJiNjEzIiwiZW1haWxfdmVyaWZpZWQiOnRydWUsIm5hbWUiOiJQZW5nZmVpIExpdSIsImdyb3VwcyI6WyJmb3JtYXRpb24iLCJoYWNrYXRob24tdW4tMjAyMiIsIm9ueXhpYSIsInBvYy1haWRhIiwicmVsZXZhbmMiLCJzcGFyay1sYWIiLCJzc3BjbG91ZC1hZG1pbiIsInZ0bCJdLCJwcmVmZXJyZWRfdXNlcm5hbWUiOiJwZW5nZmVpIiwiZ2l2ZW5fbmFtZSI6IlBlbmdmZWkiLCJsb2NhbGUiOiJmciIsImZhbWlseV9uYW1lIjoiTGl1IiwiZW1haWwiOiJsaXUucGVuZ2ZlaUBob3RtYWlsLmZyIiwicG9saWN5Ijoic3Rzb25seSJ9.UlHHpafQtwyvbrMiM5S4WhnxhZtkpvGhlCixOiOrKvTpiT_UHxT_UWcICAOEkQwzNM5XKJ5r0mWzCRcXdhgPFtN-toHkDjhuWGygHx8a5byjqeU6nrUJmH4UT_DfDTk-Y8mZMIFf82VxhySn4Lb7cn4Rh92iCty42dKrVMulC4v_ya-8ODSxPhX6SZubAPAp1BjU5uJ45p3Jj0Ny5a7_y2LnrqUwnjrEEn2Y5WJ1RRJXKxjbSq7mRSYP_H57zRtHjnaHcAkO5l5vMy0E-GiF6J-FMQBp8yJPk6Ug88Vl2Ccxam7BSGYatLCqhItH8Px8RCRpil_edEj1HvP6m9WBbA"

url="https://atlas.lab.sspcloud.fr/api/atlas/v2"

# find an entity of type hdfs_path
# curl -X POST -H 'Content-Type: application/json' -H 'Accept: application/json' \
# -H "Authorization: Bearer ${oidc_token}" "$url/search/basic" -d '@./metadata_source/searchAll.json'

# delete an entity
# entity_guid="196890cc-097e-4904-a99c-d1ff79cf4bb6"
# curl -X DELETE -H 'Content-Type: application/json' -H 'Accept: application/json' -H "Authorization: Bearer ${oidc_token}" "$url/entity/guid/${entity_guid}"
