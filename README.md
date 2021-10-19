# In this repo, we will test some data catalog solutions.
A full list of the existing solutions can be found here. 
1. https://www.notion.so/atlanhq/The-Ultimate-Repository-of-Data-Discovery-Solutions-149b0ea2a2ed401d84f2b71681c5a369
2. https://medium.com/work-bench/work-bench-snapshot-the-evolution-of-data-discovery-catalog-2f6c0425616b


As we can only use open source solution. So our possible candidates are:
- Atlas
- Amundsen
- DataHub


# Problem with the deployment of Amundsen on k8s

## Embeded elastic search chart uses a deprecated version

And the default config requires a higher privilege to create the pods, so it does not work. 
There are two solutio:
1. change the config to remove the requirement of higher privilege
2. use a self deployed elasticsearch.

## Change the default config

Add the sysctlInitContainer config and set it to false.

```yaml
elasticsearch:
  # If this set to true, you
  sysctlInitContainer:
    enabled: false
  # elasticsearch.enabled -- set this to false, if you want to provide your own ES instance.
  enabled: true

```

## Use a self deployed elasticsearch

Deploy your elasticsearch with a appropiate chart. Then get the uri of the elastic-master service (on port 9200 in general)


``` yaml
# first disable the embeded elasticsearch 
elasticsearch:
  # elasticsearch.enabled -- set this to false, if you want to provide your own ES instance.
  enabled: false

# second add the uri of your self elasticsearch
search:
search:
  # search.serviceName -- The search service name.
  serviceName: search

  # search.serviceType -- The search service type. See service types [ref](https://kubernetes.io/docs/concepts/services-networking/service/#publishing-services-service-types)
  serviceType: ClusterIP

  # Proxy information needed for the search
  proxy:
    # search.proxy.endpoint -- Endpoint of the search proxy (i.e., ES endpoint etc.)
    # You should only need to change this, if you don't use the version in this chart.
    endpoint: elasticsearch-master.user-pengfei.svc.cluster.local:9200

    # The user and password of the search proxy. This should only be set if you bring your own proxy or ES cluster in which case you must also set elasticsearch.enabled to false
    # search.proxy.user --
    user:
    # search.proxy.password --
    password:
```