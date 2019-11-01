#!/bin/bash

#
# setting policy
#
oc new-project hello-tekton
sleep 3
#oc create serviceaccount pipeline
oc create -f pipeline-sa.yaml
oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-role-to-user edit -z pipeline
oc adm policy add-role-to-user registry-viewer -z pipeline
oc adm policy add-role-to-user registry-editor -z pipeline

#for pipeline resource
oc create -f pipeline-resource.yaml
#for task
oc create -f task.yaml
#for taskrun
oc create -f taskrun.yaml 
