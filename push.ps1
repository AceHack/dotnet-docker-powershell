$ErrorActionPreference = 'Stop';

# login to docker hub
"$env:DOCKER_PASS" | docker login --username "$env:DOCKER_USER" --password-stdin

# push images
docker push acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-1709

# rebase for windows 1709
# npm install -g rebase-docker-image
# rebase-docker-image acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-sac2016 -t acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-1709 -b microsoft/dotnet:2.0.5-sdk-2.1.4-nanoserver-1709
