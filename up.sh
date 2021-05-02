#!/bin/bash
# Meditation VR Setup

docker-compose -f docker-compose-kafka.yml -f docker-compose-apps.yml up -d --build

# -f docker-compose-spark.yml