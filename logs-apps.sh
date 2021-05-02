#!/bin/bash
# Meditation VR Setup

docker-compose -f docker-compose-spark.yml -f docker-compose-kafka.yml -f docker-compose-apps.yml logs -f --tail 20 match-making-api eeg-ml-api
