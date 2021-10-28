.PHONY: build run run-d exec lint rm test clean

IMAGE := chrome-extensions-trial
CONTAINER := $(IMAGE)-container
EXEC_ARGS := /bin/bash

build: .build
.build: package.json package-lock.json \
	.eslintignore .eslintrc.js tsconfig.json \
	Dockerfile
	docker build -t $(IMAGE):latest .
	touch .build
run: build
	if [ -z "`docker ps -a | grep $(CONTAINER)`" ]; then \
		docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm $(IMAGE):latest $(RUN_ARGS); \
	fi
run-d: build
	if [ -z "`docker ps -a | grep $(CONTAINER)`" ]; then \
		docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -d -it --entrypoint /bin/bash --name $(CONTAINER) $(IMAGE):latest; \
	fi
exec: run-d
	docker exec -it $(CONTAINER) $(EXEC_ARGS)
lint: build
	if [ -z "`docker ps -a | grep $(CONTAINER)`" ]; then \
		docker run -v `pwd`/src:/workdir/src -v `pwd`/dist:/workdir/dist -it --rm $(IMAGE):latest npx eslint . --ext .ts; \
	else \
		docker exec -it $(CONTAINER) npx eslint . --ext .ts; \
	fi
rm:
	if [ -n "`docker ps -a | grep $(CONTAINER)`" ]; then \
		docker rm -f $(CONTAINER); \
	fi
test: build
	@echo "NOT IMPLEMENTED"
clean:
	rm .build
