# Rodar o Hypervisor ao iniciar PC
bcdedit /set hypervisorlaunchtype auto
# docker, rode desaclopadamente do console, publicando na porta 27017:27017, no container admin e com as variáveis de ambiente de usuário e senha como userX86 e abc123 respectivamente utilizando a imagem do mongo
docker run -d -p 27017:27017 --name admin -e MONGO_INITDB_ROOT_USERNAME={usuario} -e MONGO_INITDB_ROOT_PASSWORD={senha} mongo
# docker, rode desaclopadamente do console, publicando na porta 3306:3306, no container klinik e com a variável de ambiente de senha aceitando vazia utilizando a imagem do mysql
docker run -d -p 3306:3306 -p 33060:33060 --name klinik -e MYSQL_ALLOW_EMPTY_PASSWORD=yes mysql
# docker, rode desaclopadamente do console, publicando na porta 8082:11211, no container infinispan utilizando a imagem do jboss/infinispan-server:9.4.5.Final
docker run -d -p 8082:11211 --name infinispan jboss/infinispan-server:9.4.5.Final
# remover um container
docker rm {container}
# listar containers
docker ps
