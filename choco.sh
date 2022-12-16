# Commands
# * list - lista pacotes remotos ou locais
# * find - pesquisa pacotes remotos ou locais (mesmo que seach)
# * search - pesquisa pacotes remotos ou locais (mesmo que list)
# * info - recupera informações do pacote. Abreviação de choco search pkgname --exact --verbose
# * install - instala pacotes de várias fontes
# * pin - suprimir atualizações para um pacote
# * outdated - recupera pacotes desatualizados. Igual a upgrade all --noop
# * upgrade - atualiza pacotes de várias fontes
# * uninstall - desinstala um pacote
# * pack - empacota um nuspec para um nupkg empacotado
# * push - empurra um nupkg compilado
# * new - gera arquivos necessários para um pacote de chocolate a partir de um modelo
# * sources - visualiza e configura fontes padrão (mesmo que source)
# * source - visualiza e configura fontes padrão
# * config - Recupera e define as configurações do arquivo de configuração
# * feature - visualiza e configura recursos choco
# * features - visualiza e configura recursos choco (mesmo que feature)
# * setapikey - recupera, salva ou exclui um apikey para uma fonte particular (mesmo que apikey)
# * apikey - recupera, salva ou exclui um apikey para uma fonte particular
# * unpackself - chocolatey se auto configure

# procurar pacote no repositório
choco list {pacote}
choco find {pacote}
choco search {pacote}
# listar pacotes instalados
choco list -l
choco find -l
choco search -l
# instalar pacote em modo verboso (executar como administrador se possível)
choco install {pacote} -v
choco install {pacote} -v -f # força a instalação
# desinstalar pacote em modo verboso
choco uninstall {pacote} -v
