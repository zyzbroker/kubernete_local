#!/bin/zsh
# it deploys contour ingress controller on the kubernete cluster
# configure it to portforward 80/433

echo -- deploy contour on cluster --
kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

echo -- configure coutour to portforward 80/433 --
  kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'
