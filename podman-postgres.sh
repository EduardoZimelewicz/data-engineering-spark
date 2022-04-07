#!/bin/bash
podman create \
    -v "./init-itversity-env.sh:/docker-entrypoint-initdb.d/init-itversity-env.sh" \
    -v "./postgresql/data:/var/lib/postgresql/data" \
    -v "./data:/data" \
    -p 5432:5432 \
    -e "POSTGRES_PASSWORD=itversity" \
    --name "postgres-de" \
    postgres:13