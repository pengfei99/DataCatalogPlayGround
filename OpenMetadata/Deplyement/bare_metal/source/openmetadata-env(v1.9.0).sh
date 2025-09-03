#!/bin/bash

###################### conf for db ##############################
DB_DRIVER_CLASS="org.postgresql.Driver"
DB_SCHEME="postgresql"
# this line config the jdbc connection parameters that disable SSL, allow key retrieval, and set the timezone.
# this parameters are valid for mysql not for postgres. postgres will just ignore them
DB_PARAMS="allowPublicKeyRetrieval=true&useSSL=true&serverTimezone=UTC"
DB_USER="openmetadata_user"
DB_USER_PASSWORD="changeMe"
DB_HOST="localhost"
DB_PORT="5432"
OM_DATABASE="openmetadata_db"
################ conf for el #####################################
ELASTICSEARCH_SOCKET_TIMEOUT_SECS='60'
SEARCH_TYPE="elasticsearch"
ELASTICSEARCH_HOST="localhost"
ELASTICSEARCH_PORT="9200"
ELASTICSEARCH_SCHEME="http"
ELASTICSEARCH_USER="elastic"
ELASTICSEARCH_PASSWORD="changeMe"

################# conf for authentication ########################
AUTHENTICATION_PROVIDER="basic"
# This flag indicates if users can come and signup by themselves on the OM
AUTHENTICATION_ENABLE_SELF_SIGNUP="true"

################## conf for authorizer #######################
AUTHORIZER_ALLOWED_REGISTRATION_DOMAIN='["casd.local","casd.eu"]'
AUTHORIZER_PRINCIPAL_DOMAIN="casd.local"
AUTHORIZER_ENFORCE_PRINCIPAL_DOMAIN="false"
AUTHORIZER_ENABLE_SECURE_SOCKET="false"
AUTHORIZER_USE_ROLES_FROM_PROVIDER="false"
################### conf for jwt ############################
JWT_ISSUER="casd.local"
JWT_KEY_ID="casd-self-gen-2025-09-02"