# No Git Bash
## Gerando uma nova SSH key e adicionando ela ao ssh-agent
ssh-keygen -t rsa -b 4096 -C "email@example.com" #cria a nova SSH key
#defina o local e a passphrase
#se o ssh-agent não estiver rodando
eval $(ssh-agent -s) #inicia o ssh-agent ao fundo
ssh-add ~/.ssh/id_rsa #adiciona a chave privada SSH (id_rsa) ao ssh-agent
## Adicionando a SSH key à conta do GitHub
clip < ~/.ssh/id_rsa.pub #copia o conteúdo da chave pública SSH (id_rsa.pub) para a área de transferência
#o resto é no GitHub
ssh -T git@github.com #Testa a conexão do SSH com GitHub
## Alguns comandos de GitHub
git config --global user.name "nome" #define o nome de usuário
git config --local user.name "nome" #define o nome de usuário localmente
git config --global user.email email@exemple.com #define o email do usuário
git config --local user.email email@exemple.com #define o email do usuário localmente
git config --global alias.lol "log --oneline --decorate --all --graph" #configura globalmente a alcunha de "lol" para o comando passado
git config --global --unset alias.{alias} #exclui globalmente a alcunha de seu comando configurado
git init #inicia o repositório git
git add '*.txt' #adiciona todos os .txt a escala (staging area)
git reset '*.txt' #retira todos os .txt a escala (staging area)
git rm '*.txt' #remove o arquivo do disco
git commit -m "Adição de mensagem descrevendo o que mudou" #faz o commit com uma mensagem
git reset --soft {commit} #desfaz todos os commits depois de {commit} preservando mudanças locais (estes adicionados a escala (staging area))
git reset {commit} #desfaz todos os commits depois de {commit} preservando mudanças locais (estes fora da escala (staging area))
git reset --hard {commit} #descarta todo histórico e mudanças para o commit especificado
git log #mostra o histórico de commits. aperte 'q' para sair do comando
git log --oneline #mostra o histórico de commits em uma linha cada
git remote remove <nome> #retira um repositório
git remote add origin git@github.com:gitAccount/Repository.git #adiciona uma origem remota do repositório com SSH
git remote add origin https://github.com/gitAccount/Repository.git #adiciona uma origem remota do repositório com HTTPS
git push -u origin master #envia ao repositório remoto as mudanças feitas no ramo (branch) master
git push #envia ao repositório remoto as mudanças desde que os parâmetros estejam sendo lembrados pelo o uso do -u do push anterior
git pull origin master #sincroniza o branch master remoto com o branch master local
git pull origin master --allow-unrelated-histories #permite pull de históricos de Git diferentes
git diff HEAD #mostra as diferenças do último commit usando o ponteiro HEAD
git diff {commitAnterior} {commit} #mostra as diferenças do commit anterior e o commit atual
git checkout -- arquivo.txt #muda o arquivo para como ele estava no último commit
git branch {novoBranch} #cria um novo ramo do repositório
git checkout {novoBranch} #alterna para o branch criado anteriormente
#no branch master
git merge {novoBranch} #unifica o branch novo_branch ao branch master
git branch -d {novoBranch} #deleta o branch novo_branch
rm -f -r -d -v "nome da pasta" #remove forçadamente diretórios e seus conteúdos rercusivamente, diretórios vazios, explicando o que está sendo feito (--verbose)
#usando git flow
git flow init #habilita e configura o gitflow
git flow feature start {nomeFeature} #inicia um ramo do recurso a ser implementado
git stash #guarda as mudanças atuais para limpar o espaço de trabalho (em refs/stash) para eventualmente voltar depois
git stash list #lista os stashes (guardados)
git stash show #mostra o stash
git stash apply #aplica o stash
