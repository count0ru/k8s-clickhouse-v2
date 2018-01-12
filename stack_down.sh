NAMESPACE=$1
if [[ ! -z "$NAMESPACE" ]]; then
  NAMESPACE='--namespace='$NAMESPACE
else
  echo "usage: stack_down.sh <namespace>"
  exit
fi

kubectl delete -f zookeeper.yaml "$NAMESPACE"
kubectl delete -f statefulsets "$NAMESPACE"
kubectl delete -f services "$NAMESPACE"
