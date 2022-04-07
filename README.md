# blek-stack-docker

This docker-compose project will assist with 

> Please checkout our 
## Environment Details

This project was built so that you can test and use built-in features under Elastic Security, like detections, signals, cases, and other features.

This docker-compose project will create the following Elastic containers based on version 8.1.2:

* Elasticsearch
* Logstash
* Kibana
* Postgres

## Setup

In order to use this project, you must first include the following in a file named `.env`. I have provided an example environment variable file here [.env-example](https://github.com/swimlane/elk-tls-docker/blob/master/.env-example).

> Copy or create your own `.env` from the provided example or from the code block below

```text
ELK_VERSION=7.15.0
ELASTIC_USERNAME=elastic
ELASTIC_PASSWORD=some_password

# Configuration Variables
ELASTICSEARCH_HEAP=2g
LOGSTASH_HEAP=1g
PACKETBEAT_HEAP=256m
FILEBEAT_HEAP=256m
METRICBEAT_HEAP=256m
XPACK_ENCRYPTION_KEY=somesuperlongstringlikethisoneMQBbtsynu4bV2uxLy

# Self signed TLS certificates
CA_PASSWORD=some_password
CA_DAYS=3650
ELASTIC_DIR=/usr/share/elasticsearch
LOGSTASH_DIR=/usr/share/logstash
KIBANA_DIR=/usr/share/kibana
PACKETBEAT_DIR=/usr/share/packetbeat
FILEBEAT_DIR=/usr/share/filebeat
METRICBEAT_DIR=/usr/share/metricbeat

# Letsencrypt certificates
## Setting STAGING to true means it will generate self-signed certificates
## Setting STAGING to false means it will generate letsencrypt certificates
# STAGING=false
STAGING=true

# swag Configuration
#DOMAIN=mydomain.com
#SUBDOMAIN=kibana
#SUBFOLDER=kibana
#EMAIL=email@email.com
#TIMEZONE=America/Chicago
```

> Note: You may need to change the size of the HEAP variables in the above configuration file based on your system requirements.  The settings present are for a machine with 8GB of memory

**Additionally, you must either clone this repository or download the entire repository in order to build and run these containers.**

You can find more documentation about these settings in our [WiKi](https://github.com/swimlane/elk-tls-docker/wiki/Environment-Variables)

### Keystore

Before we build or create our containers we first need to create our keystore and certificates.  You can do this using the [docker-compose.setup.yml](docker-compose.setup.yml) yaml file.  If you run into issues you can see the associated documentation in our [WiKi Page about Certificates](https://github.com/swimlane/elk-tls-docker/wiki/Certificates) or create an issue in this repository.

#### Creating Keystore for self-signed certificates

By default creation of self-signed certificates is used and makes the most sense when testing out this project.  To do so you simply run the following command first:

```bash
docker-compose -f docker-compose.setup.yml run --rm setup
```

Please see our documentation about [Setup using self-signed certificates](https://github.com/swimlane/elk-tls-docker/wiki/Setup%20using%20self-signed%20certificates).

#### Creating Keystore & Certificates for production

If you are wanting to deploy this project in a production like environment, please see our documentation [Setup using Letsencrypt](https://github.com/swimlane/elk-tls-docker/wiki/Setup%20using%20Letsencrypt).


## Running a development environment

Now, that you have your keys/certs and [passwords](https://github.com/swimlane/elk-tls-docker/wiki/Setting%20Passwords) set we can then just restart the containers by running:

```
docker-compose up -d
```

You should be able to login into the ELK stack and be on your way.

You can find additioanl information about the environments that are created on your [Environment Details](https://github.com/swimlane/elk-tls-docker/wiki/Environment-Details) WiKi page.

## Running a production environment

Here is a [walkthrough](https://github.com/swimlane/elk-tls-docker/wiki/Letsencrypt%20Walkthrough) on setting up a production-like environment using LetsEncrypt.

You should be able to login into the ELK stack and be on your way.

You can find additioanl information about the environments that are created on your [Environment Details](https://github.com/swimlane/elk-tls-docker/wiki/Environment-Details) WiKi page.

## Common Issues

Please see our WiKi documentation for the most [Common Issues](https://github.com/swimlane/elk-tls-docker/wiki/Common-Issues) I have seen through testing and usage of this project.

To remove all images from your system run: ```docker rmi $(docker images -a -q)```
To remove all volumes from your system run: ```docker volume prune```



## Authors

* Cheu Seanghai

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE.md) file for details