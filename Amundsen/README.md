# 1 Amundsen


## 1.1 Amundsen deployment

The Amundsen K8s Helm Charts Source code can be found [here]https://github.com/amundsen-io/amundsen/tree/main/amundsen-kube-helm)


### How do I get started?

1. Make sure you have the following command line clients setup:
    - k8s (kubectl)
    - helm
2. Build out a cloud based k8s cluster, such as [Amazon EKS](https://aws.amazon.com/eks/)
3. Ensure you can connect to your cluster with cli tools in step 1.

### Prerequisites

1. Helm 2.14+
2. Kubernetes 1.14+

### Chart Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.helm.sh/stable | elasticsearch | 1.32.0 |


### Installation steps

```shell
# get the helm chart source
git clone https://github.com/amundsen-io/amundsen.git
cd amundsen/amundsen-kube-helm/templates/helm

# you should see below content
CHANGELOG.md  Chart.yaml  templates  values.yaml

# all the configuration of the deployment is located in values.yaml. The default values.yaml
# allow you to deploy a test instance
vim values.yaml

```

# if you want to have a ingress, you need to enable the ingress part in the values.yaml and add an url
```yaml
ingress:
  # --  set this to true, if you want a ingress that expose HTTP and HTTPS routes from outside the cluster to your amundsen services. Do not use this if you are in a public cloud such as AWS, GCP
  enabled: true
  annotations: {}
    # kubernetes.io/ingress.class: nginx
    # kubernetes.io/tls-acme: "true"
  # -- Assign a http url to your Amundsen service
  hosts:
    - host: amundsen.lab.sspcloud.fr
      paths: [/]
  tls: 
    - hosts:
        - amundsen.lab.sspcloud.fr
     # secretName: chart-example-tls
```

After you finished your values.yaml file configuration, you can use below command to deploy it

For Helm 3 it's now mandatory to specify a [chart reference name](https://helm.sh/docs/intro/using_helm/#helm-install-installing-a-package) e.g. `my-amundsen`:

``` shell
# download dependent chart
helm dependency build

# install the chart
helm install my-amundsen . --values ./values.yaml
```

### Common problems

#### Neo4j DBMS resource Config

You may want to override the default memory usage for Neo4J. In particular, if you're just test-driving a deployment and your node exits with status 137, you should set the usage to smaller values:

``` yaml
config:
  dbms:
    heap_initial_size: 1G
    heap_max_size: 2G
    pagecache_size: 2G
```

With this values file, you can then install Amundsen using Helm 2 with:

## 1.2 Direct access of the Neo4j server

If you want to know how the data are stored in Neo4j, you can use the [ingress_neo4j.yaml](./helm/ingress_neo4j.yaml) to create an url for the Neo4j server. Then you 

## 1.3 Load sample data to Amundsen

To load sample data, you need to build a python enviroment

```shell
# create an env with conda
conda create -n amundsen python=3.8

# check the env
conda env list

# activate the env
conda activate amundsen

# git clone the amundsen repo,
git clone https://github.com/amundsen-io/amundsen.git

# go to the databuilder folder
cd /path/to/amundsen/databuilder

# you should see below contents
CHANGELOG.md  docs     LICENSE   MANIFEST.in  README.md             requirements.txt  setup.py
databuilder   example  Makefile  NOTICE       requirements-dev.txt  setup.cfg         tests

# install the requirements
pip install -r requirements.txt

# 
python setup.py install

# run the loading script
python example/scripts/sample_data_loader.py
```

# 

## Other Notes

- For aws setup, you will also need to setup the [external-dns plugin](https://github.com/kubernetes-incubator/external-dns)
- There is an existing helm chart for neo4j, but, it is missing some features necessary to for use such as:
  - [\[stable/neo4j\] make neo4j service definition more extensible](https://github.com/helm/charts/issues/21441); without this, it is not possible to setup external load balancers, external-dns, etc
  - [\[stable/neo4j\] allow custom configuration of neo4j](https://github.com/helm/charts/issues/21439); without this, custom configuration is not possible which includes setting configmap based settings, which also includes turning on apoc.
