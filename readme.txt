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
git push
- create a release in GitHub for that tag, which will trigger the release github action to run

docker build -t mkinney/webpinggo .
docker run -d -p 8000:8000 mkinney:webpinggo

make push

brew install hadolint
