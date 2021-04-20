## Delete openebs hostpath volumes that are released

`kubectl get persistentvolumes | grep hostpath | grep Released | awk '{print $1'} | xargs -I % kubectl delete persistentvolumes %`
