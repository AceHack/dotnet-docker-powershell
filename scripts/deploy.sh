#!/bin/bash
if [ "$TRAVIS_BRANCH" == "master" ]; then
    docker login --username "$DOCKER_USER" --password "$DOCKER_PASS";
    docker push acehack/dotnet:2.0.5-sdk-powershell-2.1.4-stretch;
    ./tools/manifest-tool-linux-amd64 push from-spec dotnet/2.0/sdk-powershell-2.0.5.yml
    ./tools/manifest-tool-linux-amd64 push from-spec dotnet/2.0/sdk-powershell-2.0.yml
    ./tools/manifest-tool-linux-amd64 push from-spec dotnet/2.0/sdk-powershell-2.yml
fi;
