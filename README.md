# In this repo, we will test some data catalog solutions.
A full list of the existing solutions can be found here. 
1. https://www.notion.so/atlanhq/The-Ultimate-Repository-of-Data-Discovery-Solutions-149b0ea2a2ed401d84f2b71681c5a369
2. https://medium.com/work-bench/work-bench-snapshot-the-evolution-of-data-discovery-catalog-2f6c0425616b


As we can only use open source solution. So our possible candidates are:
- Atlas
- Amundsen
- DataHub


## 1 Amundsen


### 1.1 Amundsen deployment

Problem with the deployment of Amundsen on k8s:
1. Embeded elastic search chart uses a deprecated version
2. No ingress support

#### 1.1.1 Migrate the deprecated es 
We have found out that not only the es is deprecated, but also the default config requires a higher privilege to create the pods. 
There are two solutions:
1. change the config to remove the requirement of higher privilege
2. use a self deployed elasticsearch.

##### Change the default config

Add the sysctlInitContainer config and set it to false. But even after this modification, the pod are not running correctly. There are error messages inside it.

```yaml
elasticsearch:
  # If this set to true, you will need cluster admin privilege.
  sysctlInitContainer:
    enabled: false
```

##### Migraate to the official es k8s repo
We just modified the Amundsen helm chart to use the official es k8s repo 


## 2. Datahub