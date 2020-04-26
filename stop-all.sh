echo --step1: stop mongo express --
kubectl delete -f mongo-express.yml

echo --step2: stop mongo --
kubectl delete -f mongo.yml

kubectl delete -f pv.yml
kubectl delete -f fast.yml

echo --step3: stop cluster --
kind delete cluster --name demo
