#!/bin/bash

#
# setting policy
#
oc project orzbar

#for resource
oc delete -f resource/petclinic-resources.yaml
#for pipeline
oc delete -f pipeline/petclinic-deploy-pipeline.yaml
#for task
oc delete -f task/s2i-java-8-task.yaml
oc delete -f task/openshift-client-task.yaml
#for app
oc delete -f petclinic.yaml

oc delete sa pipeline
