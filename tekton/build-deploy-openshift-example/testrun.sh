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
oc create -f s2i-java-8-task.yaml
oc create -f openshift-client-task.yaml
#for pipeline
oc create -f build-deploy-openshift-example-pipeline.yaml
#for resource
oc create -f pipeline-resources.yaml

tkn pipeline start build-deploy-openshift-example-pipeline \
        -r app-git=petclinic-git \
        -r app-image=petclinic-image \
        -s pipeline
