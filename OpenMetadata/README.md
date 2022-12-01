## Kubernetes Deployment

### Prerequisites
- A Kubernetes cluster on any cloud
- kubectl to manage Kubernetes resources
- Helm to deploy resources based on Helm charts from the OpenMetadata repository


### Step 1. Create creds for MySQL and Airflow

```shell
kubectl create secret generic mysql-secrets --from-literal=openmetadata-mysql-password=openmetadata_password
kubectl create secret generic airflow-secrets --from-literal=openmetadata-airflow-password=admin
```
