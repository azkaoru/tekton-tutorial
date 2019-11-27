#!/bin/bash

#
# setting policy
#
oc new-project helloworld-pipeline
sleep 3
oc create serviceaccount pipeline
oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-role-to-user edit -z pipeline
oc adm policy add-role-to-user registry-viewer -z pipeline
oc adm policy add-role-to-user registry-editor -z pipeline

#for task1
oc create -f echo-hello-task.yaml
#for task2 
oc create -f cat-world-task.yaml
#for resources
oc create -f pipeline-resources.yaml
#for pipeline
oc create -f helloworld-pipeline.yaml
#for pipelinerun
oc create -f helloworld-pipelinerun.yaml
