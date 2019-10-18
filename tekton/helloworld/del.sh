#!/bin/bash

#for taskrun
oc delete -f echo-helloworld-taskrun.yaml 
#for task
oc delete -f echo-helloworld-task.yaml
