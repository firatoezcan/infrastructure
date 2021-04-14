# Commands I am running for my local setup:

## **You need:**

- [`kubectl`](https://kubernetes.io/docs/tasks/tools/)
- [`mkcert`](https://github.com/FiloSottile/mkcert#installation)
- [`helm`](https://helm.sh/docs/intro/install/#through-package-managers)
- [`helmfile`](https://github.com/roboll/helmfile#installation)

---

### **Add MKCERT_CAROOT to your environment**

`grep -qxF 'export MKCERT_CAROOT=$(mkcert -CAROOT)' ~/.bashrc || echo 'export MKCERT_CAROOT=$(mkcert -CAROOT)' >> ~/.bashrc`

### **Uninstall previous k3s installation (DATA IS LOST)**

`test -f /usr/local/bin/k3s-uninstall.sh && /usr/local/bin/k3s-uninstall.sh`

### **Install k3s**

`curl -sfL https://get.k3s.io | sh -`

### **Verify that the installation worked**

`sudo k3s kubectl get namespace`

### **Add the k3s config to your local config**

`sh copyK3sToConfig.sh`

### Install helm dependencies for helmfile

`helm plugin install https://github.com/jkroepke/helm-secrets`
`helm plugin install https://github.com/databus23/helm-diff`

# Setting up Traefik locally

Run this command to check if you are using Networkmanager  
`systemctl status NetworkManager`

If you are running NetworkManager, check out the [DNS.md](./DNS.md).

Otherwise read this blogpost, it's amazing: [Kubernetes & Traefik locally with a wildcard certificate](https://medium.com/localz-engineering/kubernetes-traefik-locally-with-a-wildcard-certificate-e15219e5255d)

### Setup the default cluster configuration (only cert manager for now)

`helmfile apply`

### Deploy the whoami service to check if everything worked

```
kubectl create namespace test
kubectl apply -f manifest.yaml
```
