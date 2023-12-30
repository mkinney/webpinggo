webpinggo - simple web ping app written in go

go mod init
go mod tidy
go run main.go
go build
open http://localhost:8000
open http://localhost:8000/ping

Create a personal access token:
- Read access to actions variables, metadata, and secrets
- Read and Write access to actions, code, commit statuses, pull requests, repository hooks, and workflows

workflow for a release:
- commit changes
- tag release
git tag -a v0.2 -m "v0.2"
git push origin --tags
- create a release in GitHub for that tag
