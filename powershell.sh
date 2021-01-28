# %useprofile% do cmd
$env:USERPROFILE
# Descobrir o processo que está usando a porta 8081
netstat -aon | findstr "8081"
