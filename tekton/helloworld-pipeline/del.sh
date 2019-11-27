#!/bin/bash

#
# setting policy
#

#for pipelinerun
oc delete -f helloworld-pipelinerun.yaml

#for pipeline
oc delete -f helloworld-pipeline.yaml

#for resources
oc delete -f pipeline-resources.yaml

#for task1
oc delete -f echo-hello-task.yaml

#for task2 
oc delete -f cat-world-task.yaml
