#!/bin/bash
set -e
set -x

if [[ ${LINKERD_UNINSTALL} ]]
then
  linkerd install --ignore-cluster | kubectl delete -f -
  exit 0
fi
if [[ ${LINKERD_UPGRADE} ]]
then
  linkerd upgrade | kubectl apply -f -
else
  linkerd install | kubectl apply -f -
fi

linkerd check
while [[ $? -ne 0 ]]
do 
  sleep 5
  linkerd check
done
