webpinggo - simple web ping app written in go

go mod init
go mod tidy
go run main.go
go build
open http://localhost:8000
open http://localhost:8000/ping

workflow for a release:
- commit changes
- tag release
git tag -a v0.2 -m "v0.2"
git push origin --tags
- create a release in GitHub for that tag
