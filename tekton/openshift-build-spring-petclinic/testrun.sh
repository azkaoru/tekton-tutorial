#!/bin/bash

#
# setting policy
#
oc new-project orzbar
sleep 3
oc create serviceaccount pipeline
oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-role-to-user edit -z pipeline
oc adm policy add-role-to-user registry-viewer -z pipeline
oc adm policy add-role-to-user registry-editor -z pipeline

#for app
oc create -f petclinic.yaml
#for task
oc create -f task/s2i-java-8-task.yaml
oc create -f task/openshift-client-task.yaml
#for pipeline
oc create -f pipeline/petclinic-deploy-pipeline.yaml
#for resource
oc create -f resource/petclinic-resources.yaml

tkn pipeline start petclinic-deploy-pipeline \
        -r app-git=petclinic-git \
        -r app-image=petclinic-image \
        -s pipeline
