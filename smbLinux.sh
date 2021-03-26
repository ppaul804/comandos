sudo su # entra como super usuario
apt install samba # Samba é um software gratuito de uma re-implementação do protocolo de rede SMB
cd /etc/samba # local onde fica o smb.conf
cp smb.conf smb.bak.conf # faz um backup do arquivo de configuração do samba
mr smb.conf # remove a configuração, caso queira configurá-lo do zero
service smbd status # mostra se o samba está disponível e ativo
service smbd stop # para o servidor
service smbd start # inicia o servidor
mkdir /compartilhado # cria pasta (pode ser criado em qualquer lugar no sistema)
chgrp users /compartilhado # altera o grupo de acessor a pasta 
chmod 775 /compartilhado # altera as permições de leitura, execução e escrita
service smbd restart # reinicia o servidor
useradd <nome> -m -G users # cria o usuário de acesso a pasta em um grupo
passwd <nome> # cria uma senha do sistema UNIX para o usuário
smbpaswd -a <nome> # cria uma senha de acesso a pasta
# No Windows, acesse \\<ip-da-maquina-com-samba>

# Configurações do Samba
#======================= Global Settings =======================
[global]
server string = %h server (Samba, Ubuntu) # descrição do servidor
workgroup = WORKGROUP # nome do contexto do workgroup
security = user # requer uso de um conta Unix para cada usuario que acessa o servidor
name resolve order = bcast host # ordem de checagem de nomes de host
include = /etc/samba/shares.conf # utiliza configurações de compartilhamento de um arquivo externo
map to guest = Bad User # não será obrigatório o login de usuario
#======================= Share Definitions =======================
# As configurações aqui podem estar no shares.conf, desde que importadas pelo include
[Compartilhado] # nome do compartilhamento
path = /compartilhado
valid users = @users # configura os usuarios válidos ao acesso a pasta
force group = users # força o compartilhamento ao grupo. Existe o force user também
create mask = 0664 # máscara de permissões de arquivos criados
force create mode = 0664
directory mask = 0775
force directory mode = 0775
public = yes
writable = yes

[Compartilhado Protegido]
path = /compartilhado-protegido
valid users = @users
force group = smbgroup
create mask = 0664
force create mode = 0664
directory mask = 0775
force directory mode = 0775
public = yes
writable = no

[homes] # configuração da pasta home de cada usuário
browseable = no 
create mask = 0700
directory mask = 0700
valid users = %S
writable = yes
