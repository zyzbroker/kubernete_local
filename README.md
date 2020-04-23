# Run Kubernete Locally

Using kubernete platform to manage cloud native applciations is a great idea for any company, small or large to cut down the IT cost. This semi-intelligent cloud platform are rule-based application platform to heal and scale application without human interference. The optimization of resource allocation and auto-scaling makes it the No.1 choice of the cloud deployment strategy.

The best way to understand and learn kubternete platform is to run it locally. In this repository, we show you how to do that.

## Software Requirement

- kind
- docker desktop

## Use Case

We want to set up mongo DB environment so that we can manage mongo database from web frontend. we want to deploy mongodb and web UI on the kubernete platform.

## How to

### step 1

- install docker desktop
- install kind

### step 2

Create a kubernete cluster

```sh
  kind create cluster --config cluster.yml
```

### step 3

install ingress controller from Contour and apply patch to forward hostports to inggress controller

```sh

  kubectl apply -f https://projectcontour.io/quickstart/contour.yaml

  kubectl patch daemonsets -n projectcontour envoy -p '{"spec":{"template":{"spec":{"nodeSelector":{"ingress-ready":"true"},"tolerations":[{"key":"node-role.kubernetes.io/master","operator":"Equal","effect":"NoSchedule"}]}}}}'

```

### step 4

create resources for mongo db

```sh

  kubectrl apply -f mongo.yml

```

### step 5

create resource for mongo web ui

```sh

  kubectl apply -f mongo-express.yml

```

### step 6

Pod and container creation need some time. Thus we need to check all pods are in the ready mode

```sh

    kubectl get pods

```

![get pods](/images/kubectl_get_pods.png)

### step 7

open web browser and type in "http://localhost", you should see mongo web UI as shown below

![mongo web ui](/images/mongo_web_ui.png)

### step 8

Once you have kubernet cluster running locally, you might want to clean up, here are several tips

- delete resources

```sh

  kubectl delete -f mongo.yml

```

- delete cluster

```sh

  kind delete cluster --name kind

```
