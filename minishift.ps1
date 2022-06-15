# com Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
minishift start

# com VirtualBox
bcdedit /set hypervisorlaunchtype off
minishift start --vm-driver virtualbox
