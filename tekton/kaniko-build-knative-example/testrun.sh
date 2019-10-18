#!/bin/bash
KUBEADMIN_PASS=<PASSWD>

oc new-project fooproject
#
#for openshift registry auth
#

#specfic password: $(oc whoami -t)
oc create secret generic openshift-cr-push-secret --type="kubernetes.io/basic-auth" --from-literal=username=kubeadmin --from-literal=password=$KUBEADMIN_PASS

#regist openshift push-secret
oc annotate secret openshift-cr-push-secret tekton.dev/docker-0=image-registry.openshift-image-registry.svc:5000

#
#service account for tekton pipeline 
# require: kanative resource deploy in "serving.knative.dev" api group
#
oc apply -f sa/pipeline-account.yaml

#
#warn:kaniko executor require root
# change scc(privileged) to anyuid 
#

#oc adm policy add-scc-to-user privileged -z pipeline
oc adm policy add-scc-to-user anyuid -z pipeline
oc adm policy add-role-to-user edit -z pipeline
oc adm policy add-role-to-user registry-viewer -z pipeline
oc adm policy add-role-to-user registry-editor -z pipeline

#
#appy tekton resource
#
oc apply -f tasks/source-to-image.yaml
oc apply -f tasks/deploy-using-oc.yaml
oc apply -f resources/picalc-git.yaml
oc apply -f pipeline/build-and-deploy-pipeline.yaml
oc apply -f run/picalc-pipeline-run.yaml

