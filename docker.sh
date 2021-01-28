# docker, rode desaclopadamente do console, publicando na porta 27017:27017, no container admin e com as variáveis de ambiente de usuário e senha como userX86 e abc123 respectivamente utilizando a imagem do mongo
docker run -d -p 27017:27017 --name admin -e MONGO_INITDB_ROOT_USERNAME={usuario} -e MONGO_INITDB_ROOT_PASSWORD={senha} mongo
# remover um container
docker rm {container}
# listar containers
docker ps
