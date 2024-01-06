FROM golang:1.21 AS builder
WORKDIR /app
COPY main.go go.mod ./
RUN GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o app .

FROM alpine:latest
LABEL org.opencontainers.image.source=https://github.com/mkinney/webpinggo
LABEL maintainer="mike.kinney@gmail.com"
RUN apk update \
	&& apk add ca-certificates \
	&& update-ca-certificates \
	&& apk add shadow \
	&& groupadd -r app \
	&& useradd -r -g app -s /sbin/nologin -c "Docker image user" app

USER app
WORKDIR /app

COPY --from=builder /app/app ./app
EXPOSE 8000
CMD ["./app"]
