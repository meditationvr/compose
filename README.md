# Meditation VR - DevOps / Docker setup

This is the setup repository for the [Meditation VR](https://github.com/meditationvr) project. It contains a `docker-compose.yml` file with the container orchestration of this system.

## Getting Started

* Install [Docker](https://docs.docker.com/install/)
* Run `./setup.sh`
  * This will setup [match-making-api](https://github.com/meditationvr/match-making-api) and [ml-jobs](https://github.com/meditationvr/eeg-ml-api). In addition to that, it will also setup Cassandra DB, a Hadoop Cluster, Kafka, Spark Cluster, Zookeeper and other services needed.

## Post-setup links

* `http://localhost:8001`: Kafka Web UI
* `http://localhost:3000` and `ws://localhost:3000/socket.io/?EIO=4&transport=websocket`: [Match Making API](https://github.com/meditationvr/match-making-api)
* `http://localhost:8080`: Spark Web UI


## Useful commands

* `./up.sh`: Build images and turn on containers
* `./down.sh`: Turn down containers
* `./build.sh`: This will build all the images for all apps
* `./logs-apps.sh`: Logs [match-making-api](https://github.com/meditationvr/match-making-api)and [eeg-ml-api](https://github.com/meditationvr/eeg-ml-api)
* `./logs-infrastructure.sh`: Logs `match-making-db`, `kafka-broker`(broker), `kafka-topics-ui`(web-interface) and `kafka-zookeeper`, `spark-master`, `spark-worker`

## Debugging

* To check real time logs of the applications, run `./logs-apps.sh`.
* To check real time logs of the infrastructure, run `./logs-infrastructure.sh`.
* To `ssh` any container:
  * `docker ps`
  * `docker exec -ti 3912bba70e66 bash`

## Stopping services

* To stop services, either:
  * Run `./down.sh` to stop all services.
  * Run `docker-compose stop service_name` to stop a specific service.

## Setup a Spark Job environment 

* Follow the instructions in [this link](https://br.hortonworks.com/tutorial/setting-up-a-spark-development-environment-with-scala/) and [this other one](https://sundog-education.com/spark-scala/)

## Connecting to Match Making DB

* Download [Python 2](https://www.python.org/downloads/release/python-2715/)
* Add `C:\Python27` in the `Path` env variable. Calling `python` should trigger Python 2
* Add `C:\Program Files\apache-cassandra-3.11.4\bin` in the `Path` env variable.
* `cqlsh -u match_making_user`
    * Password: `match_making_pw`
* `use match_making;`
    * `COPY match_making.user_calibrations_eeg_data (pk,userId,calibrationId,eeg,date,label) TO './user_calibrations_eeg_data.csv' WITH HEADER = TRUE;`
    * `COPY match_making.user_instructions_eeg_data (pk,userId,eeg,date,predictedLabels) TO './user_instructions_eeg_data.csv' WITH HEADER = TRUE;`
    * `COPY match_making.users (userId,name,accessToken,accessTokenExpirationTime,permissions,type) TO './users.csv' WITH HEADER = TRUE;`
    * `COPY match_making.user_calibrations (calibrationId,userId,startDate,endDate,modelsGenerated) TO './user_calibrations.csv' WITH HEADER = TRUE;`

## Ngrok

* `./ngrok http -subdomain=meditationvr 3000`

## LICENSE

* Check [LICENSE.md](https://github.com/meditationvr/compose/blob/master/LICENSE.md) for more details
