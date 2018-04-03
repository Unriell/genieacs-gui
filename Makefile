VERSION = $(shell  if [ $TAG = "" ]; then echo "0.0.1"; else echo "$TAG"; fi)
SRC_PATH=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

.PHONY: version
version:
	echo $(VERSION)

.PHONY: build
build: 
	$(SRC_PATH)/build/build-docker.sh

.PHONY: push
push: build
	$(SRC_PATH)/build/docker-push.sh
