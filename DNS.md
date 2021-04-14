## System information

---

`cat /etc/os-release`

```
NAME="Manjaro Linux"
ID=manjaro
ID_LIKE=arch
BUILD_ID=rolling
PRETTY_NAME="Manjaro Linux"
ANSI_COLOR="32;1;24;144;200"
HOME_URL="https://manjaro.org/"
DOCUMENTATION_URL="https://wiki.manjaro.org/"
SUPPORT_URL="https://manjaro.org/"
BUG_REPORT_URL="https://bugs.manjaro.org/"
LOGO=manjarolinux
```

---

## DNS Configs

(using Networkmanager and dnsmasq)

---

`cat /etc/NetworkManager/conf.d/dns.conf`

```
[main]
dns=dnsmasq
```

`cat /etc/NetworkManager/dnsmasq.d/dns.conf`

```
address=/local.dev/localhost/127.0.0.1
server=1.1.1.1
```

`cat /etc/hosts`

```
# Host addresses
127.0.0.1  localhost
::1        localhost ip6-localhost ip6-loopback
ff02::1    ip6-allnodes
ff02::2    ip6-allrouters
```

## Also change this lol

`sudo nano /etc/dnsmasq.conf`
