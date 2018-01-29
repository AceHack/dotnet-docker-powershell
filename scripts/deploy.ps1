$ErrorActionPreference = 'Stop';

# login to docker hub
docker login --username "$env:DOCKER_USER" --password "$env:DOCKER_PASS"

# push images
docker push acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-sac2016
#docker push acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-1709

# rebase for windows 1709
npm install -g rebase-docker-image
rebase-docker-image acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-sac2016 -t acehack/dotnet:2.0.5-sdk-powershell-2.1.4-rebase-nanoserver-1709 -b microsoft/nanoserver:1709
#rebase-docker-image acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-sac2016 -t acehack/dotnet:2.0.5-sdk-powershell-2.1.4-rebase-nanoserver-1709 -s microsoft/dotnet:2.0.5-sdk-2.1.4-nanoserver-sac2016 -b microsoft/dotnet:2.0.5-sdk-2.1.4-nanoserver-1709

# push multi-arch tags
.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.0.5-rebase.yml
.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.0-rebase.yml
.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2-rebase.yml
#.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.0.5.yml
#.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.0.yml
#.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.yml
