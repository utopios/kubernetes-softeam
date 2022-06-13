### Création du cluster avec le mappage des ports avec le host vers le conteneur master du cluster.
kind create cluster --name tp-kubernetes --config kind/config-kind.yml

#build des images 
#image result
docker build -t tp-result ../result/.
#image vote
docker build -t tp-vote ../vote/.
#image worker
docker build -t tp-worker ../worker/.

#envoie des images dans notre cluster kind
kind load docker-image tp-result --name tp-kubernetes
kind load docker-image tp-worker --name tp-kubernetes
kind load docker-image tp-vote --name tp-kubernetes

#Création du namespace
kubectl create -f ressources/k8s/namespace.yml

#Création des services de types node port
kubectl create -f ressources/k8s/service-node-port-result.yml
kubectl create -f ressources/k8s/service-node-port-vote.yml

#création des services de types cluster ip
kubectl create -f ressources/k8s/cluster-ip-postgres.yml
kubectl create -f ressources/k8s/cluster-ip-redis.yml