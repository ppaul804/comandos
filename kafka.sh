# no ambiente windows troque bin/{comando}.sh por bin/windows/{comando}.bat

# iniciando servidor kafka
bin/zookeeper-server-start.sh config/zookeeper.properties
bin/kafka-server-start.sh config/server.properties
# lista os tópicos
bin/kafka-topics.sh --list --zookeeper localhost:2181
# criar tópico
bin/kafka-topics.sh --create --zookeeper localhost:2181 --replication-factor 1 --partitions 2 --topic {nomeTopico}
# descrever tópico
bin/kafka-topics.sh --describe --zookeeper localhost:2181 --topic {nomeTopico}
# detalhes dos consumidores
kafka-consumer-groups.sh --describe --bootstrap-server localhost:9092 --group {nomeGrupo}
# ler conteúdo do tópico
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --topic {nomeTopico}
# ler conteúdo do tópico desde o ínico da criação dele
bin/kafka-console-consumer.sh --bootstrap-server localhost:9092 --from-beginning --topic {nomeTopico}
# props.put(ConsumerConfig.GROUP_ID_CONFIG, UUID.randomUUID().toString()); # Para testes no java

