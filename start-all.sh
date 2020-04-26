echo --step1: run cluster --
kind create cluster --config cluster.yml --name demo

echo --step2: provision contour ingress controller --
./config-contour.sh

echo --step3: wait for cluster to be ready in 25 seconds --
kubectl apply -f fast.yml
kubectl apply -f pv.yml
sleep 25

echo --step4: run mongo resources --
kubectl apply -f mongo.yml

echo --step5: run mongo express resources --
kubectl apply -f mongo-express.yml

