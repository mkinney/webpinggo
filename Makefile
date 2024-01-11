.DEFAULT_GOAL := fmt

# get the most recent annotated tag
TAG = $(shell git describe --abbrev=0)

.PHONY:fmt build

fmt:
	go fmt ./...

build:
	go build

clean:
	@rm webpinggo 2> /dev/null || true

lint:
	# go lint
	golangci-lint run
	# docker lint
	hadolint Dockerfile

dockerb: clean # build
	docker build -t mkinney/webpinggo:latest .
	docker build -t mkinney/webpinggo:${TAG} .

dockerr: # run
	docker run --name wpg -d -p 8000:8000 mkinney/webpinggo

dockerc: clean # clean
	docker kill wpg || true
	docker system prune

push: dockerb
	docker push mkinney/webpinggo:latest
	docker push mkinney/webpinggo:${TAG}

FORCE: ;

