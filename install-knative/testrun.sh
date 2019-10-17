#!/bin/sh

#
# requirement: install servicemeshoperator with openshit console
#

oc new-project istio-system
oc apply -f 01_smcp.yaml

#[root@sakura7 install-knative]# oc get pod -w
#NAME                                    READY   STATUS    RESTARTS   AGE
#cluster-local-gateway-f5b588559-v2pj8   1/1     Running   0          2m1s
#istio-citadel-5868d748f9-p2ghc          1/1     Running   0          4m17s
#istio-galley-6dbd687674-nmjh4           1/1     Running   0          3m43s
#istio-ingressgateway-688bf858c6-fsgj2   1/1     Running   0          2m
#istio-pilot-84ccd44c6d-7j4lc            1/1     Running   0          2m58s

#
# install ServiceMeshMemberRoll Resource
#
oc apply -f 02_smmr.yaml 

#
# install serverless-operator using openshift console
#

# install  KnativeServing
oc apply -f 03_serving.yaml

# deploy sampleapp
oc new-project fooproject
oc apply -f 04_service.yaml
