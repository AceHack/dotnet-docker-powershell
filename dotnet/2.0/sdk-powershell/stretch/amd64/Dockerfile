# escape=`

ARG DotNetRepo=microsoft/dotnet
ARG DotNetTag=2.0.5-sdk-2.1.4-stretch

# Install PowerShell into dotnet image
FROM ${DotNetRepo}:$DotNetTag

# Install system components
# Import the public repository GPG keys
# Register the Microsoft Product feed
# Update the list of products
# Install PowerShell
RUN sudo apt-get update && `
    sudo apt-get install curl gnupg apt-transport-https && `
    curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add - && `
    sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-debian-stretch-prod stretch main" > /etc/apt/sources.list.d/microsoft.list' && `
    sudo apt-get update && `
    sudo apt-get install -y powershell

# Setup PowerShell as default shell
SHELL ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
ENTRYPOINT ["pwsh", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
