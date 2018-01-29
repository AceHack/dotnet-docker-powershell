Install-Package -Name Docker -ProviderName DockerMsftProvider -Update -Force
Start-Service Docker
Write-Host Server version $(gp 'HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion').BuildLabEx
docker version
