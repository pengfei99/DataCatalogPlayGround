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