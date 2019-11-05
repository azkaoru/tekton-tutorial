# exec

```
./testrun.sh
```

# confirm 

```
# tkn pipelineruns list
NAME                                                STARTED          DURATION    STATUS      
build-deploy-openshift-example-pipeline-run-xp69v   52 minutes ago   7 minutes   Succeeded   

# tkn pipelinerun logs -f build-deploy-openshift-example-pipeline-run-xp69v

