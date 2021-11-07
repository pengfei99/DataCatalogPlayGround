# In this repo, we will test some data catalog solutions.

A full list of the existing solutions can be found here. 
1. https://www.notion.so/atlanhq/The-Ultimate-Repository-of-Data-Discovery-Solutions-149b0ea2a2ed401d84f2b71681c5a369
2. https://medium.com/work-bench/work-bench-snapshot-the-evolution-of-data-discovery-catalog-2f6c0425616b


As we can only use open source solution. So our possible candidates are:
- Atlas
- Amundsen
- DataHub
- Marquez (Not tested yet)

If you are not familliar with the terminology such as data governance, data management and metadata management. Please go
to this [page](https://github.com/pengfei99/DataGovernance/blob/main/README.md)


## 1. Existing solutions
Below figure shows a classification of the existing solutions

![Metadata_management_tools_classification](https://raw.githubusercontent.com/pengfei99/DataCatalogPlayGround/master/img/Metadata_management_tools_classification.png)

### 1.1 The four age of the existing solution's evolution

- Stone age: No software, people use pdf, excel, or other documents to describe the data. Everything is done manually. 
- Bronze age: Basic software with a relational database, similar to Excel, but provides a web interface that allows you
  to ingest/update metadata.
- Iron age: software designed to help the data professionals in collecting metadata automatically and managing them.
- Golden age: allow all users(e.g. business users, data professionals) to contribute to the metadata ingestion in a 
  collaborative and painless way. Data professionals can easily audit the metadata modification(e.g. accept or reject).
  Business users can require new metadata features of data(e.g. new data quality criteria, more attributes of a data description)
  
## 2. How to choose the right tool?
To choose the right tool/solution for your organization, you need to follow below steps:

### 2.1 Narrow your scope
The first thing to do is to understand your exact need, and narrow your scope down. There is no magical tool that can 
resolve all your requirements.
    
- Do I need a data governance tool to help me to define the policies and metrics? 
  
- Do I need a Data validation tool to do data quality control? 
    
- Do I need a metadata management tool to catalog data and do data discovery, data lineage?

### 2.2 Identify the top pain points 
Once you have defined your scope, you need to identify the top pain points that affect your data productivity. 
For each pain point, you need to add a severity(e.g. 1-10). 

For example, if your data scientist or analyst spend lots of their time on finding the data of interest, you should put
this pain point **finding data of interest with a severity 10**.

### 2.3 Define solution requirements 
After identifying the pain points, we need to provide a solution for each pain point. Then we need to define detailed
requirements for each solution. Based on the severity of the pain points, we should associate a priority to the solution 
implementation.

For example, for finding the data of interest, we need to provide a **data catalog/discovery service**. This data catalog
service should:
- contain a metadata store to store all types of metadata(e.g. intra, inter, global)
- provide a search engine to find data easily by using 
    - data description (e.g format, owner, creation date, etc),
    - semantic description (e.g taxonomy, thesaurus, etc.)
    - data relation (e.g. lineage, grouping)

### 2.4 Define the benchmark metric and evaluate tools 

In previous section, we have defined all **functional requirements**. To evaluate a tool, we also need to define **non-functional
requirements** such as cost of deployment, maintenance, security (of the tool). You should talk with the data professionals to
define these non-functional requirements.

Now we need to define the benchmark metric based on all the requirements and evaluate the existing tools. Base on the score
of each tool, we should know which tool is the best solution for your organization.

## 3. Example for our metadata management solution evaluation.

### 3.1 Our scope

We narrowed our scope to **metadata management**. So we will not address problems such as data validation, security, etc. If you
are not familial with the five domains of the data management, please visit this [page](https://github.com/pengfei99/DataGovernance/blob/main/README.md)

### 3.2 Identify pain points

|pain point|severity(0~10)|
|----------------------------------|----|
|Hard to find the data of interest|10|
|Not knowing the data provider name |10|
|Not knowing the data provenance|8|
|Not knowing the data schema|9|
|Not knowing who and when of the data modification|7|
|Not knowing data are duplicated or not |5|

### 3.3. Define solution requirements

