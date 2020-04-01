#!/bin/bash

source /usr/local/etc/ocp4.config

#XXX the todoapp does not work with newer Node.js runtimes

oc new-app --name todoapp \
    --build-env npm_config_registry=\
http://${RHT_OCP4_NEXUS_SERVER}/repository/nodejs \
    -e DATABASE_NAME=todo \
    -e DATABASE_SVC=tododb \
    -e DATABASE_USER=todoapp \
    -e DATABASE_PASSWORD=redhat123 \
    -e DATABASE_INIT=false \
    --context-dir todo-single \
    nodejs:6~https://github.com/${RHT_OCP4_GITHUB_USER}/DO288-apps

