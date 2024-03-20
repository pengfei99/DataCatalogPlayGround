# OpenMetadata

OpenMetadata is a unified platform for `discovery, observability, and governance` powered by 
`a central metadata repository, in-depth lineage, and seamless team collaboration`.  

Based on Open Metadata Standards and APIs, supporting connectors to a wide range of data services, 
OpenMetadata enables end-to-end metadata management, giving you the freedom to unlock the value of your data assets.

You can visit their git repo [git](https://github.com/open-metadata/OpenMetadata) and their documentation

## Deployment

OpenMetadata provides three type installations:
- bare metal
- docker compose
- Kubernetes

### Bare metal deployment
You can follow their [official doc](https://docs.open-metadata.org/v1.3.x/deployment/bare-metal) to deploy `open metadata`
in bare metal mode.

### Docker compose deployment
You can follow their [official doc](https://docs.open-metadata.org/v1.3.x/deployment/docker) to deploy `open metadata` with docker compose

You will have 4 main containers in the docker compose services:
- Mysql/postgresql DB: Store the metadata
- ElasticSearch: search engine
- Openmetadata server: The web app
- Airflow server: to help us to ingest data

### Kubernetes Deployment

You can follow their [official doc](https://docs.open-metadata.org/v1.3.x/deployment/docker) to deploy `open metadata` 
in k8s cluster

#### Prerequisites
- A Kubernetes cluster on any cloud
- kubectl to manage Kubernetes resources
- Helm to deploy resources based on Helm charts from the OpenMetadata repository

### Test your deployment

If you use the default configuration, you can access two service now:
- Open Metadata
#### Step 1. Create creds for MySQL and Airflow

```shell
kubectl create secret generic mysql-secrets --from-literal=openmetadata-mysql-password=openmetadata_password
kubectl create secret generic airflow-secrets --from-literal=openmetadata-airflow-password=admin
```

## Ingestion

### Sample data ingestion

OpenMetadata comes with a little sample dataset which allows to test the basic functionalities. But you need to run 
some commands to load them.

I only tested the ingestion process in the docker compose deployment.

### In Docker compose deployment
Login into the ingestion container, you can find an airflow dag file called `/opt/airflow/dags/airflow_sample_data.py`

You can find the below content

```python
from datetime import timedelta

import yaml
from airflow import DAG

from metadata.workflow.workflow_output_handler import print_status

try:
    from airflow.operators.python import PythonOperator
except ModuleNotFoundError:
    from airflow.operators.python_operator import PythonOperator

from airflow.utils.dates import days_ago

from metadata.workflow.metadata import MetadataWorkflow

# basic dag configuration
default_args = {
    "owner": "user_name",
    "email": ["username@org.com"],
    "email_on_failure": False,
    "retries": 3,
    "retry_delay": timedelta(seconds=10),
    "execution_timeout": timedelta(minutes=60),
}

# openmetadata ingestion workflow config
config = """
source:
  type: custom-database
  serviceName: sample_data
  serviceConnection:
    config:
      type: CustomDatabase
      sourcePythonClass: metadata.ingestion.source.database.sample_data.SampleDataSource
      connectionOptions:
        sampleDataFolder: "/home/airflow/ingestion/examples/sample_data"
  sourceConfig: {}
sink:
  type: metadata-rest
  config: {}
workflowConfig:
  openMetadataServerConfig:
    hostPort: http://openmetadata-server:8585/api
    authProvider: openmetadata
    securityConfig:
      jwtToken: "eyJraWQiOiJHYjM4OWEtOWY3Ni1nZGpzLWE5MmotMDI0MmJrOTQzNTYiLCJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJhZG1pbiIsImlzQm90IjpmYWxzZSwiaXNzIjoib3Blbi1tZXRhZGF0YS5vcmciLCJpYXQiOjE2NjM5Mzg0NjIsImVtYWlsIjoiYWRtaW5Ab3Blbm1ldGFkYXRhLm9yZyJ9.tS8um_5DKu7HgzGBzS1VTA5uUjKWOCU0B_j08WXBiEC0mr0zNREkqVfwFDD-d24HlNEbrqioLsBuFRiwIWKc1m_ZlVQbG7P36RUxhuv2vbSp80FKyNM-Tj93FDzq91jsyNmsQhyNv_fNr3TXfzzSPjHt8Go0FMMP66weoKMgW2PbXlhVKwEuXUHyakLLzewm9UMeQaEiRzhiTMU3UkLXcKbYEJJvfNFcLwSl9W8JCO_l0Yj3ud-qt_nQYEZwqW6u5nfdQllN133iikV4fM5QZsMCnm8Rq1mvLR0y9bmJiD7fwM1tmJ791TUWqmKaTnP49U493VanKpUAfzIiOiIbhg"
"""


def metadata_ingestion_workflow():
    workflow_config = yaml.safe_load(config)
    workflow = MetadataWorkflow.create(workflow_config)
    workflow.execute()
    workflow.raise_from_status()
    print_status(workflow)
    workflow.stop()


with DAG(
    "sample_data",
    default_args=default_args,
    description="An example DAG which runs a OpenMetadata ingestion workflow",
    start_date=days_ago(1),
    is_paused_upon_creation=True,
    catchup=False,
) as dag:
    ingest_task = PythonOperator(
        task_id="ingest_using_recipe",
        python_callable=metadata_ingestion_workflow,
    )
```

If you encounter the `file not found error of /home/airflow/ingestion/examples/sample_data`. you need to get the sample
data from the repo git 
