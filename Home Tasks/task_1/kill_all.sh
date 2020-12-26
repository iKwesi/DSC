#!/usr/bin/bash
docker rmi -f $(sudo docker images -aq)

