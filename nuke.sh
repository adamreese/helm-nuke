#!/usr/bin/env bash
set -euo pipefail

HELM="${HELM_BIN} --host ${TILLER_HOST}"

releases=$(${HELM} list --short)

if [[ -n "${releases}" ]]; then
  echo "Deleting all releases..."

  for r in ${releases}; do
    echo "${r}"
    ${HELM} delete --purge "${r}"
  done
fi

echo
echo "Deleting any rogue configmaps for good measure"
kubectl -n kube-system delete configmap --selector=OWNER=TILLER
