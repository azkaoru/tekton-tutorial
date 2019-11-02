#!/bin/bash

#
# setting policy
#
oc new-project tomcat-cluster
sleep 3

# pipelineアカウントでtekton-pipelineを実行するが
# パイプラインでTomcatのapp.yamlをoc applyする際に
# clusterRoleも登録する。その際にClusterRoleを登録する権限がないため、エラーになるのをイカで回避する。
oc create -f pipeline-account.yaml -n tomcat-cluster

oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-role-to-user edit -z pipeline
oc adm policy add-role-to-user registry-viewer -z pipeline
oc adm policy add-role-to-user registry-editor -z pipeline

#oc adm policy add-role-to-group edit system:serviceaccount:tomcat-cluster:pipeline -n tomcat-cluster

#for pipeline resource
oc create -f pipeline-resource.yaml
#for task
oc create -f task.yaml
#for taskrun
oc create -f taskrun.yaml 
