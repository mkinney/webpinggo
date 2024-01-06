.DEFAULT_GOAL := fmt

.PHONY:fmt build

fmt:
	go fmt ./...

build:
	go build

clean:
	@rm webpinggo 2> /dev/null || true

lint:
	golangci-lint run

dockerb: clean # build
	docker build -t mkinney/webpinggo:latest .

dockerr: # run
	docker run --name wpg -d -p 8000:8000 mkinney/webpinggo

dockerc: clean # clean
	docker kill wpg || true
	docker system prune

push: dockerb
	docker push mkinney/webpinggo:latest

FORCE: ;

