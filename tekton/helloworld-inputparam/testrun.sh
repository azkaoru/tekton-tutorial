#!/bin/bash

#
# setting policy
#
oc new-project hello-inputparam-tekton
sleep 3
oc create serviceaccount pipeline
oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-role-to-user edit -z pipeline
oc adm policy add-role-to-user registry-viewer -z pipeline
oc adm policy add-role-to-user registry-editor -z pipeline

#for task
oc create -f echo-helloworld-task.yaml
#for taskrun
oc create -f echo-helloworld-taskrun.yaml 

#confirm taskrun
#tkn taskrun logs echo-inputparam-hello-task-run
