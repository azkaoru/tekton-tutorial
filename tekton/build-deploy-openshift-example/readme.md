# exec

```
./testrun.sh
```

# pipelinerun using tkn cli 

```
# tkn pipelineruns list
NAME                                                STARTED          DURATION    STATUS      
build-deploy-openshift-example-pipeline-run-xp69v   52 minutes ago   7 minutes   Succeeded   

# tkn pipelinerun logs -f build-deploy-openshift-example-pipeline-run-xp69v
```

# pipelinerun using yaml

```
oc apply -f build-deploy-openshift-example-pipelinerun.yaml
# tkn pipelinerun list
NAME                                         STARTED          DURATION    STATUS      
build-deploy-openshift-example-pipelinerun   24 minutes ago   6 minutes   Succeeded   
# tkn pipelinerun logs -f build-deploy-openshift-example-pipelinerun
```


