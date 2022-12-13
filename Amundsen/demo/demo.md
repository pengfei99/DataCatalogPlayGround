# Deploy Amundsen

```shell

cd /home/onyxia/work/DataCatalogPlayGround/Amundsen/helm-chart/templates/Amundsen-deployment

# download dependent chart
helm dependency build

# install the chart
helm install amundsen . --values ./values.yaml
```

# Insert metadata

```shell
# create an env with conda
conda create -n amundsen python=3.8

# check the env
conda env list

# activate the env
conda activate amundsen


# go to the databuilder folder
cd /home/onyxia/work/amundsen/databuilder

# you should see below contents
CHANGELOG.md  docs     LICENSE   MANIFEST.in  README.md             requirements.txt  setup.py
databuilder   example  Makefile  NOTICE       requirements-dev.txt  setup.cfg         tests

# install the requirements
pip install -r requirements.txt

# 
python setup.py install

# run the loading script
python example/scripts/sample_data_loader2.py
```