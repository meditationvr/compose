#!/bin/bash
# Meditation VR Setup

docker-compose -f docker-compose-spark.yml -f docker-compose-kafka.yml -f docker-compose-apps.yml down
