#!/bin/bash

# Script to build the kafka-connect-bintray connector and move them to the plugin path directory.
# Also provides ability to download monitoring interceptors for connect.

export PLUGINPATH:="connect-plugins"
export INTERCEPTORSPATH:="monitoring-interceptors"
export INTERCEPTORS_VERSION="4.0.0"

all: install bintray

install:
	if [[ ! -d $(PLUGINPATH) ]]; then mkdir $(PLUGINPATH); fi
	if [[ ! -d $(INTERCEPTORSPATH) ]]; then mkdir $(INTERCEPTORSPATH); fi

interceptors:
	./mvnw dependency:get -DremoteRepositories=http://packages.confluent.io/maven \
    -DgroupId=io.confluent \
    -DartifactId=monitoring-interceptors \
    -Dversion=$(INTERCEPTORS_VERSION) \
    -Dtransitive=false \
    -Ddest=$(INTERCEPTORSPATH)/

# TODO: download connector jars from maven central rather than build
bintray:
	make install
	./mvnw clean package -f kafka-connect-bintray/pom.xml -DskipTests=true
	cp -R kafka-connect-bintray/target/kafka-connect-target/usr/share/kafka-connect/kafka-connect-bintray $(PLUGINPATH)

clean:
	rm -fr $(PLUGINPATH)/kafka-connect-bintray
