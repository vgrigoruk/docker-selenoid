#!/bin/bash

echo "Starting selenoid..."
selenoid -conf /etc/selenoid/browsers.json -limit ${MAX_INSTANCES} -docker-api ${DOCKER_API}
