#!/bin/bash

COMMON_NAME=cluster1-inter-router-tls-ca

# Generate a CA private key
openssl genrsa -out ${COMMON_NAME}.key 2048

# Create a self signed Certificate, valid for 10yrs
# with the 'signing' option set
openssl req -x509 -new -nodes -key ${COMMON_NAME}.key \
  -subj "/CN=${COMMON_NAME}" \
  -days 3650 -reqexts v3_req -extensions v3_ca \
  -out ${COMMON_NAME}.crt

# Save the key pair as a secret in default namespace
oc create secret tls ${COMMON_NAME}-key-pair \
   --cert=${COMMON_NAME}.crt \
   --key=${COMMON_NAME}.key \
   --namespace=default
