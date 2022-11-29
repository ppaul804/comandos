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
