echo "$DOCKER_PASSWORD" | docker login --username "$DOCKER_USER" --password-stdin;
docker push acehack/dotnet:2.0.5-sdk-powershell-2.1.4-stretch;
