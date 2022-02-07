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
oc label route zync-3scale-api-7ftxb "router=external"
