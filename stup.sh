sudo kind create cluster --image kindest/node:v1.21.1 --config kind-config.yaml
sudo kubectl cluster-info --context kind-kind
sudo helm repo add apache-airflow https://airflow.apache.org
sudo helm repo update
export NAMESPACE=example-namespace
export RELEASE_NAME=example-release
sudo kubectl create namespace $NAMESPACE
sudo helm install $RELEASE_NAME apache-airflow/airflow --namespace $NAMESPACE --set-string "env[0].name=AIRFLOW__CORE__LOAD_EXAMPLES"  --set-string "env[0].value=True"
#sudo helm repo add apache-airflow https://airflow.apache.org
#sudo helm repo update
#export NAMESPACE=example-namespace
#sudo kubectl create namespace $NAMESPACE
#export RELEASE_NAME=example-release
#sudo helm install $RELEASE_NAME apache-airflow/airflow --namespace $NAMESPACE
sudo kubectl apply -f pv.yaml --namespace $NAMESPACE
sudo kubectl apply -f pvc.yaml --namespace $NAMESPACE
sudo kubectl apply -f pvdeploy.yaml --namespace $NAMESPACE
sudo kubectl get pods --namespace $NAMESPACE
sudo helm list --namespace $NAMESPACE
sudo docker build --pull --tag my-dags:0.0.1 .
sudo kind load docker-image my-dags:0.0.1
sudo helm upgrade $RELEASE_NAME apache-airflow/airflow --namespace $NAMESPACE --set images.airflow.repository=my-dags --set images.airflow.tag=0.0.1
sudo kubectl port-forward svc/$RELEASE_NAME-webserver 8087:8080 --namespace $NAMESPACE &
#sudo kubectl port-forward svc/$RELEASE_NAME-webserver 8888:8888 --namespace $NAMESPACE &
#sudo kubectl get pods --namespace $NAMESPACE
#sudo kubectl exec -n $NAMESPACE example-release-scheduler-695c896bf-5xsjb -it -- /bin/bash
