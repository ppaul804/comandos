# fonte:https://plus.diolinux.com.br/t/balena-etcher-ferrou-com-um-pendrive-novo/31717/2
# Em um Prompt de Comando como Administrador:

diskpart

# Nessa parte você deve observar qual é a unidade certa. Este processo limpa o
# pen-drive, então certifique-se de selecionar o correto no próximo passo.
list disk 

# Onde X é o número do pen-drive que você observou no passo anterior
select disk X

# Isto limpa o disco, destruindo todas as partições existentes.
clean

# Para criar uma partição.
create partition primary

# Para formatar a partição recém criada.
format fs=fat32 quick

# Para deixar o pen-drive visível para o Windows.
assign

# Para sair do DiskPart.
exit