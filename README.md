mkadm
=====


<a name="toc">Table of contents</a>
-----------------------------------

- [Overview](#overview)
- [Dependencies](#dependencies)
- [Usage](#usage)
  + [Initialization](#init)
  + [Instances](#instances)
  + [Miscellany](#miscellany)


<a name="overview">Overview</a>
-------------------------------

Scripts for building, configuring, and installing Miki.


<a name="dependencies">Dependencies</a>
---------------------------------------

- doadm


<a name="usage">Usage</a>
-------------------------

### <a name="init">Initialization</a>

Before using this script, you must first authenticate with DigitalOcean. To do so, run:

    doadm -I


### <a name="instances">Instances</a>

To create a Miki instance with the following configuration:

- name: `goliath`
- domain: `goliath.streamsharing.io`
- droplet name: `miki-goliath-www`
- database init: `~/miki/dat/mimix-miki.pg`
- ssl: yes
- ssh keys:
  - `6f:40:1c:47:98:d2:e8:03:05:e2:d2:f4:71:f3:ff:36`
  - `a7:d4:c1:ab:64:21:e5:96:e9:fa:58:1c:93:73:ed:56`
- firewall name: `miki-goliath-fw`
- allowed ip addresses:
  - `73.6.24.189`
  - `110.54.155.49`
  - `68.224.77.144`
- allowed ports:
  - `22`
  - `80`
  - `443`
- input directory: `~/miki/miki`

```
mkadm -w goliath -d goliath.streamsharing.io \
-D miki-goliath-www -i /var/miki -s \
-I ~/miki/dat/mimix-miki.pg \
-k 6f:40:1c:47:98:d2:e8:03:05:e2:d2:f4:71:f3:ff:36,a7:d4:c1:ab:64:21:e5:96:e9:fa:58:1c:93:73:ed:56 \
-F miki-goliath-fw -A $(checkip),73.6.24.189,110.54.155.49,68.224.77.144 -P 22,80,443 \
~/miki/miki
```

When the installation has finished, you’ll see a message containing the IP address of the Miki instance. Use this IP address as the DNS A record for `goliath.streamsharing.io` using your domain registrar.


### <a name="miscellany">Miscellany</a>

To display usage summary, run:

    mkadm --help
