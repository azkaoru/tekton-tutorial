# Install Openshift Serverless

環境

* OCP 4.1.16 on aws ipi

## Install OpenShift Servicemesh Operator

OpenShift4のコンソールより、servicemeshoperatorをインストールする


## Install Istio コントロールプレーン

istio-system プロジェクトにIstioコントールプレーンをインストールする

```
oc new-project istio-system
oc apply -f 01_smcp.yaml
```

Pod確認
```
[root@sakura7 install-knative]# oc get pod -w
NAME                                    READY   STATUS    RESTARTS   AGE
cluster-local-gateway-f5b588559-v2pj8   1/1     Running   0          2m1s
istio-citadel-5868d748f9-p2ghc          1/1     Running   0          4m17s
istio-galley-6dbd687674-nmjh4           1/1     Running   0          3m43s
istio-ingressgateway-688bf858c6-fsgj2   1/1     Running   0          2m
istio-pilot-84ccd44c6d-7j4lc            1/1     Running   0          2m58s
```
## Install ServiceMeshMemberRoll 

マルチテナント用の設定を実施。knativeでアプリをdeployしたいユーザプロジェクトを追加すること。


```
oc apply -f 02_smmr.yaml 
```

## Install KnativeServing 
oc apply -f 03_serving.yaml

## Deploy sampleapp
oc new-project fooproject
oc apply -f 04_service.yaml

デプロイできているかは、以下で確認

```
# oc get ksvc
