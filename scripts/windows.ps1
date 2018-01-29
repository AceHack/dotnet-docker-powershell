$ErrorActionPreference = 'Stop';

docker build -t acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-1709 dotnet/2.0/sdk-powershell/nanoserver-1709/amd64
docker push acehack/dotnet:2.0.5-sdk-powershell-2.1.4-nanoserver-1709
.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.0.5.yml
.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.0.yml
.\tools\manifest-tool-windows-amd64.exe push from-spec dotnet\2.0\sdk-powershell-2.yml
