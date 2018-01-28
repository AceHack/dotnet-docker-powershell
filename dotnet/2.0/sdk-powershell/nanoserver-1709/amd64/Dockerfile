# escape=`

# Args used by from statements must be defined here:
ARG DotNetRepo=microsoft/dotnet
ARG DotNetTag=2.0.5-sdk-2.1.4-nanoserver-1709
ARG WindowsServerCoreRepo=microsoft/windowsservercore
ARG WindowsServerCoreTag=latest
ARG PS_VERSION=6.0.1

# Use server core as an installer container to extract PowerShell,
# As this is a multi-stage build, this stage will eventually be thrown away
FROM ${WindowsServerCoreRepo}:$WindowsServerCoreTag AS installer-env

# Arguments for installing powershell, must be defined in the container they are used
ARG PS_VERSION

ENV PS_DOWNLOAD_URL https://github.com/PowerShell/PowerShell/releases/download/v$PS_VERSION/PowerShell-$PS_VERSION-win-x64.zip

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]

RUN if (!($env:PS_VERSION -match '^\d+\.\d+\.\d+(-\w+(\.\d+)?)?$' )) {throw ('PS_Version ({0}) must match the regex "^\d+\.\d+\.\d+(-\w+(\.\d+)?)?$"' -f $env:PS_VERSION)}
RUN Invoke-WebRequest $Env:PS_DOWNLOAD_URL -OutFile powershell.zip

RUN Expand-Archive powershell.zip -DestinationPath \PowerShell

# Install PowerShell into dotnet image
FROM ${DotNetRepo}:$DotNetTag

# In order to set system PATH, ContainerAdministrator must be used
USER ContainerAdministrator 

# Copy Powershell Core from the installer containter
ENV ProgramFiles C:\Program Files
COPY --from=installer-env ["\\PowerShell\\", "$ProgramFiles\\PowerShell"]

# Set system path
RUN setx /M PATH "%PATH%;%ProgramFiles%\PowerShell"

# Persist %PSCORE% ENV variable for user convenience
ENV PSCORE="$ProgramFiles\PowerShell\pwsh.exe"

# return to low privilege user
USER ContainerUser

# Setup PowerShell as default shell
SHELL ["pwsh.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
ENTRYPOINT ["pwsh.exe", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
