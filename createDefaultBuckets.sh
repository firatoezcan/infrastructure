declare NAMESPACE=$1

declare BUCKETS=$2

# Todo: Check if the pod is running instead of sleeping
# sleep 40

# Create the bucket if it does not exist
for iBUCKET in $BUCKETS
do
  kubectl -n $NAMESPACE get pods | grep minio-$NAMESPACE | awk '{print $1}' | xargs -I % kubectl -n $NAMESPACE exec % -- mkdir -p export0/$iBUCKET
done

