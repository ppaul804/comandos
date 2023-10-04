oc login
# Lista todos projetos
oc projects
# Seleciona projeto
oc project <project-name>
# Procura pod
oc get pods | Select-String <pod-name>
# Abre terminal do pod
oc rsh <pod-name>
# Deixar rota externa
oc label route <3scale-route-name> "router=external"
# Criar um novo app usando um repositorio privado pela branch develop
oc new-app --name=myapp https://github.com/youruser/yourprivaterepo#develop --source-secret=yoursecret
# Criar um novo app usando um repositorio privado pela branch develop com a imagem do java
oc new-app --name=myapp openshift/java:latest~https://github.com/youruser/yourprivaterepo#develop --source-secret=yoursecret
# Listar todos os recursos do app criado
oc get all -o name --selector app=myapp
# Exportar os recursos do app criado
oc export bc,dc,is,svc,route,secret,sa -l app=myapp -o yaml > myapp.yaml
# Aplicar os recursos do app criado
oc apply -f myapp.yaml
# Apagar todos os recursos do app criado
oc delete all --selector app=myapp
# Acessa o pod do mongo com a porta 27017
oc port-forward <mongo-pod-name> 27017:27017