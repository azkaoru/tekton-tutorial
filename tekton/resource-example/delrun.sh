#!/bin/bash

#
# setting policy
#
#for taskrun
oc delete -f taskrun.yaml 

#for task
oc delete -f task.yaml

#for pipeline resource
oc delete -f pipeline-resource.yaml

oc delete -f pipeline-sa.yaml
