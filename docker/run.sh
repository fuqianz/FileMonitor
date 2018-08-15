#!/bin/bash
export SO_TAG=$(git rev-parse --short HEAD)
docker-compose -f docker-compose.yml up --no-build -d
