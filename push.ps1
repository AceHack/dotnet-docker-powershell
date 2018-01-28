$ErrorActionPreference = 'Stop';

# login to docker hub
"$env:DOCKER_PASS" | docker login --username "$env:DOCKER_USER" --password-stdin

# push images
docker push acehack/dotnet:2.0.5-sdk-powershell
