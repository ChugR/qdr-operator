#!/bin/bash

# Create service account for operator
kubectl create -f deploy/service_account.yaml

# Create the RBAC role and role-binding that grants
# the permissions necessary for the operator to function.
kubectl create -f deploy/role.yaml
kubectl create -f deploy/role_binding.yaml

# Deploy the CRD to the cluster that defines the Interconnect resource.
kubectl create -f deploy/crds/interconnectedcloud_v1alpha1_interconnect_crd.yaml

# Next, deploy the operator into the cluster.
kubectl create -f deploy/operator.yaml

# Create a pod on the Kubernetes cluster for the QDR Operator.
# Observe the qdr-operator pod and verify it is in the running state.
kubectl get pods -l name=qdr-operator

# If for some reason, the pod does not get to the running state,
# look at the pod details to review any event that prohibited the pod from starting.
kubectl describe pod -l name=qdr-operator

# You will be able to confirm that the new CRD has been registered
# in the cluster and you can review its details.
kubectl get crd
kubectl describe crd interconnects.interconnectedcloud.github.io
