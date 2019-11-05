# test

```
./testrun.sh
```

# confirm

```
# tkn task list
NAME                    AGE
echo-inputparam-hello   8 seconds ago

# tkn taskrun list
NAME                             STARTED          DURATION   STATUS             
echo-inputparam-hello-task-run   12 seconds ago   ---        Running(Pending)   

# tkn taskrun logs -f echo-inputparam-hello-task-run

[echo] hello

# oc apply -f echo-inputparam-overwrite-taskrun.yaml 
taskrun.tekton.dev/echo-overwrite-inputparam-task-run created

# tkn taskrun logs -f echo-overwrite-inputparam-task-run

[echo] chao
```

confirm taskrun's  status
```
# tkn taskrun list
NAME                                 STARTED         DURATION     STATUS      
echo-overwrite-inputparam-task-run   4 minutes ago   49 seconds   Succeeded
```
