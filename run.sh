#!/bin/bash
cd  /opt/app/
ls -al
chmod +x run.sh
docker-compose up --build -d app
