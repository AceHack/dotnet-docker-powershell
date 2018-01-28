$ErrorActionPreference = 'Stop';

# build images
docker build -t acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-1709 dotnet/2.0/sdk-powershell/nanoserver-1709/amd64
