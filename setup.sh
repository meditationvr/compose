#!/bin/bash
# Meditation VR Setup

echo ">>> Setup started!"

echo ">>> Cloning repositories"
for app in eeg-ml-api student-app match-making-api instructor-app; do
		git clone "https://github.com/meditationvr/$app.git" "../$app"
done

echo ">>> Destroying existent containers"
docker-compose -f docker-compose-spark.yml -f docker-compose-kafka.yml -f docker-compose-apps.yml down --rmi all
rm -rf ./database-match-making/persistence

echo ">>> Creating application containers"
docker-compose -f docker-compose-spark.yml -f docker-compose-kafka.yml -f docker-compose-apps.yml up -d --build --remove-orphans --force-recreate

echo ">>> Setup complete!"
