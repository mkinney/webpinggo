FROM alpine
LABEL maintainer="mike.kinney@gmail.com"
copy webpinggo /usr/local/bin
EXPOSE 8000
ENTRYPOINT ["webpinggo"]
