# For Windows 10< or version below

dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart

# Set WSL 2 as default version

wsl --set-default-version 2

# install Ubuntu 20.04 LTS from Microsoft Store

wsl -install -d Ubuntu

# run Ubuntu 20.04 LTS

wsl
