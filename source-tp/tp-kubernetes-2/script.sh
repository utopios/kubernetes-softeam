#### Etape 1 => Création d'un cluster kind avec le bon mappage des ports.
kind create cluster --name tp-monitoring --config ressources/kind/config.yml

### Etape 2 => Création d'un namespace
kubectl create -f ressources/k8s/namespace.yml

### Etape 3 => création des serviceAccount, role et roleBinding
kubectl create -f ressources/k8s/fluentd/rbac.yml

### Etape 4 => Création du volume
kubectl create -f ressources/k8s/elasticsearch/ressources-volume.yml