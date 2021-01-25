#!/usr/bin/env bash

git clean -xfd
env
mvn -DskipTests clean package
