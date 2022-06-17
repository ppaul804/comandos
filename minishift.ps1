# com Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
# ou ativar o recurso (feature) do windows Hyper-V
minishift start

# com VirtualBox
bcdedit /set hypervisorlaunchtype off
minishift start --vm-driver virtualbox
