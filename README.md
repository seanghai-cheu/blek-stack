# elastic-stack-docker (elk-stack)

This docker-compose project will assist with setting up and creating a ELK stack using either self-signed TLS certificates or using LetsEncrypt certificates for communications. In general you get HTTPS for all services.

## Environment Details

This project was built so that you can test and use built-in features under Elastic Security, like detections, signals, cases, and other features.

This docker-compose project will create the following Elastic containers based on version 8.1.2:

* Elasticsearch
* Logstash
* Kibana
* Postgres

## Setup

In order to use this project, you must first include the following in a file named `.env`. I have provided an example environment variable file here [.env-example](https://github.com/swimlane/elk-tls-docker/blob/master/.env-example).

> Copy `.env-example` to  `.env` 

```text
# Version of Elastic products
STACK_VERSION=8.1.2

# Set the cluster name
CLUSTER_NAME=docker-cluster

# Set to 'basic' or 'trial' to automatically start the 30-day trial
LICENSE=basic

# Increase or decrease based on the available host memory (in bytes)
MEM_LIMIT=1073741824

# ----------- Elasticsearch Configuration
ELASTIC_DIR=/usr/share/elasticsearch
ELASTIC_PORT=9200
ELASTIC_PASSWORD=elastic

# ----------- Kibana Configuration
KIBANA_DIR=/usr/share/kibana
KIBANA_PORT=5601
KIBANA_PASSWORD=kibana

# ----------- Logstash Configuration
LOGSTASH_DIR=/usr/share/logstash

# ----------- Postgres Configuration
POSTGRES_PORT=5432
POSTGRES_USERNAME="root"
POSTGRES_PASSWORD="root"
POSTGRES_DATABASE="elasticsearch"

# ----------- Postgres Admin Configuration
PG_ADMIN_PORT=8081
PG_ADMIN_USERNAME="admin@example.com"
PG_ADMIN_PASSWORD="admin"
```

## How to run the elk-stack (elastic-stack)

By default creation of self-signed certificates is used and makes the most sense when testing out this project. To do so you simply run the following command first:

```bash
docker-compose -f docker-compose.setup.yml run --rm setup
```

Running a development environment

```
docker-compose up -d
```

If you wish to remove the volumes, please run this command

```
docker-compose down -v
```

## Authors

* Cheu Seanghai

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details