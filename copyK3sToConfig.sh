sudo sed 's/default/k3s-local/g' /etc/rancher/k3s/k3s.yaml > k3s.yaml
cp ~/.kube/config ~/.kube/config.backup
chmod go-r ~/.kube/config.backup
KUBECONFIG=~/.kube/config:$(pwd)/k3s.yaml \
kubectl config view --merge --flatten > ~/.kube/merged_kubeconfig
mv ~/.kube/merged_kubeconfig ~/.kube/config
chmod go-r ~/.kube/config
sudo rm k3s.yaml
