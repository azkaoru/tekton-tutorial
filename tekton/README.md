# tekton-tutorial with openshift servlerss(knative)

##事前準備

* OpenShift Pipeline(tekton)のインストール

* OpenShift Serverless(knative)のインストール

https://github.com/azkaoru/tekton-tutorial/tree/master/install-knative

## 確認

openshift-pipelines(tekton)の確認 
```
[root@sakura7 tekton-tutorial]# oc get pod -n openshift-pipelines
NAME                                           READY   STATUS    RESTARTS   AGE
tekton-pipelines-controller-6fc5b5cf57-rj9wv   1/1     Running   4          13d
tekton-pipelines-webhook-57c798c6d4-pm7f7      1/1     Running   1 
```

istio コントールプレーンの確認
```
[root@sakura7 tekton]# oc get pod  -n istio-system
NAME                                    READY   STATUS    RESTARTS   AGE
cluster-local-gateway-f5b588559-v2pj8   1/1     Running   4          23h
istio-citadel-5868d748f9-p2ghc          1/1     Running   0          23h
istio-galley-6dbd687674-nmjh4           1/1     Running   0          23h
istio-ingressgateway-688bf858c6-fsgj2   1/1     Running   4          23h
istio-pilot-84ccd44c6d-7j4lc            1/1     Running   0          23h
```

knativeservingの確認
```
[root@sakura7 tekton]# oc get pod -n knative-serving
NAME                                      READY   STATUS    RESTARTS   AGE
activator-6db59d5465-jnq7t                1/1     Running   0          23h
autoscaler-58cdbf6d5c-drv26               1/1     Running   0          23h
controller-7c88984b8f-gcdb6               1/1     Running   0          23h
networking-certmanager-698f44c4df-7j26j   1/1     Running   0          23h
networking-istio-6fc85948c4-hscsf         1/1     Running   0          23h
webhook-5d6d95854-clbj9                   1/1     Running   0          23h
```


## tektonパイプラインの実行

以下コマンドでtokenを取得して、testrun.shに設定してください。

```
oc login -u kubeadmin -p <passwd>
oc whoami -t
```

tektonパイプラインの実行
```
cd tekton
./testrun.sh
```



