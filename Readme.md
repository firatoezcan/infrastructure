# NOT PRODUCTION READY // WORK IN PROGRESS

# Commands I am running for my local setup:

Detailed explanations can be found here: // Todo

## **You need:**

- [`kubectl`](https://kubernetes.io/docs/tasks/tools/)
- [`mkcert`](https://github.com/FiloSottile/mkcert#installation)
- [`helm`](https://helm.sh/docs/intro/install/#through-package-managers)
- [`helmfile`](https://github.com/roboll/helmfile#installation)

---

## **If you live on the edge and want to run a single block, run this**

```
grep -qxF 'export MKCERT_CAROOT=$(mkcert -CAROOT)' ~/.bashrc || echo 'export MKCERT_CAROOT=$(mkcert -CAROOT)' >> ~/.bashrc
test -f /usr/local/bin/k3s-uninstall.sh && /usr/local/bin/k3s-uninstall.sh
curl -sfL https://get.k3s.io | sh -
sudo k3s kubectl get namespace
sh copyK3sToConfig.sh
helm plugin install https://github.com/jkroepke/helm-secrets
helm plugin install https://github.com/databus23/helm-diff
helmfile apply
kubectl create namespace test
kubectl apply -f manifest.yaml
```

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

### **Install helm dependencies for helmfile**

`helm plugin install https://github.com/jkroepke/helm-secrets`  
`helm plugin install https://github.com/databus23/helm-diff`

### **Routing your ingress hosts to localhost**

Either just add the domains you use for your Traefik hosts in your `/etc/hosts` or run `dnsmasq` like I do.

Run this command to check if you are using Networkmanager  
`systemctl status NetworkManager`

If you are running NetworkManager, check out the [DNS.md](./DNS.md).

Otherwise read this blogpost to setup `dnsmasq`: [Kubernetes & Traefik locally with a wildcard certificate](https://medium.com/localz-engineering/kubernetes-traefik-locally-with-a-wildcard-certificate-e15219e5255d)

### **Run prepare scripts to install CRDs**

`sh fixCRDs.sh`

### **Setup the default cluster configuration (only cert manager for now)**

`helmfile apply`

### **Deploy the whoami service to check if everything worked**

```
kubectl create namespace test
kubectl apply -f manifest.yaml
```

### **Services that are pre-deployed**

For convenience `minio-operator` is already deployed so you can add S3 storage into your namespaces via `./cluster-config/values.yaml`.  
`harbor` is also deployed as your local docker registry and helm repository.

You can reach the services if you added those entries to your `/etc/hosts` via:

```
127.0.0.1  harbor.local.dev
127.0.0.1  harbor.minio.local.dev
```

### Harbor access

Domain: `harbor.local.dev`  
Username: `admin`  
Password: `Harbor12345`

### Minio access

Domain: `harbor.minio.local.dev`  
Username: `minio`  
Password: `minio123`
