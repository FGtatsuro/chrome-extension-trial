.PHONY: build run run-d exec lint rm test clean

IMAGE := chrome-extensions-trial
CONTAINER := $(IMAGE)-container
EXEC_ARGS := /bin/bash

docker/build: .build
.build: package.json package-lock.json \
	.eslintignore .eslintrc.js tsconfig.json \
	Dockerfile
	docker build -t $(IMAGE):latest .
	touch .build

lint: docker/build
	docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm $(IMAGE):latest npx eslint src
build: docker/build
	docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm $(IMAGE):latest npx tsc
test: docker/build
	@echo "NOT IMPLEMENTED"
clean:
	rm .build
