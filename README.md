# Run Kubernete Locally

Using kubernete platform to manage cloud native applciations is a great idea for any company, small or large to cut down the IT cost. This semi-intelligent cloud platform are rule-based application platform to heal and scale application without human interference. The optimization of resource allocation and auto-scaling makes it the No.1 choice of the cloud deployment strategy.

The best way to understand and learn kubternete platform is to run it locally. In this repository, we show you how to do that.

## Software Requirement

- kind
- docker desktop
- kubectl CLI

## Use Case

We want to set up mongo DB environment so that we can manage mongo database from web frontend. we want to deploy mongodb and web UI on the kubernete platform.

## How to

### step 1

- install docker desktop
- install kind
- install kubectrl CLI

### step 2

run start-all.sh to create kubernete cluster and resources

- A cluster called "kind"
- Contour ingress controller and envoy proxy for httpproxy
- mongo resources, include pod, service, container
- mongo express resources, include pod, service, container, proxymapping (web ui)

```sh
  ./start-all.sh
```

### step 3

Pod and container creation need some time. Thus we need to check all pods are in the ready mode

```sh
    kubectl get pods
```

![get pods](/images/kubectl_get_pods.png)

### step 4

open web browser and type in "http://localhost", you should see mongo web UI as shown below

![mongo web ui](/images/mongo_web_ui.png)

### step 8

Once you have kubernet cluster running locally, run the following sh script to stop and delete all resources

```sh

  ./stop-all.sh

```
