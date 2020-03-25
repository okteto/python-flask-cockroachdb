#!/bin/sh

export COCKROACH_URL="postgresql://cockroachdb-public:26257?insecure=true"
cockroach sql -e 'DROP DATABASE IF EXISTS todo' --insecure
cockroach sql -e 'CREATE DATABASE todo' --insecure