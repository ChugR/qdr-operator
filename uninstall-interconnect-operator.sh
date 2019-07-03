#!/bin/bash

oc delete -f deploy/crds/interconnectedcloud_v1alpha1_interconnect_cr.yaml
oc delete -f deploy/operator.yaml
oc delete -f deploy/role.yaml
oc delete -f deploy/role_binding.yaml
oc delete -f deploy/cluster_role.yaml
oc delete -f deploy/cluster_role_binding.yaml
oc delete -f deploy/service_account.yaml
oc delete -f deploy/crds/interconnectedcloud_v1alpha1_interconnect_crd.yaml

