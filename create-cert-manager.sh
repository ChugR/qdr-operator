#!/bin/bash

oc create namespace cert-manager

# Disable resource validation on the cert-manager namespace
oc label namespace cert-manager certmanager.k8s.io/disable-validation=true

# Install the CustomResourceDefinitions and cert-manager itself
oc apply --validate=false -f https://github.com/jetstack/cert-manager/releases/download/v0.8.1/cert-manager-openshift.yaml
