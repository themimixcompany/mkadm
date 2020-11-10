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

- [doadm](https://github.com/themimixcompany/doadm)


<a name="usage">Usage</a>
-------------------------

### <a name="init">Initialization</a>

Before using this script, you must first authenticate with DigitalOcean. To do so, run:

    doadm -I


### <a name="instances">Instances</a>

To create a Miki instance with the following configuration,

- domain: `goliath.streamsharing.io`
- droplet name: `miki-goliath-www`
- firewall name: `miki-goliath-fw`
- database init: `~/miki/dat/mimix-miki.pg`
- ssh keys:
  - `a7:d4:c1:ab:64:21:e5:96:e9:fa:58:1c:93:73:ed:56`
- allowed ip addresses:
  - `73.6.24.189`
- allowed ports:
  - `22`
  - `80`
  - `443`
- input directory: `~/miki/miki`

run:

```
mkadm -in goliath -I ~/miki/dat/mimix-miki.pg -fA 73.6.24.189.144
```

When the installation has finished, you’ll see a message containing the IP address of the Miki instance. Use this IP address as the DNS A record for `goliath.streamsharing.io` using your domain registrar.

To explicitly enable SSL on `miki-goliath-www`, run:

```
mkadm -h goliath -s
```

To change the hostname of `miki-goliath-www` to `goliath.mimix.io`, run:

```
mkadm -h goliath -N goliath.mimix.io
```

To get the date on `miki-goliath-www`, run:

```
mkadm -h goliath -c date
```


### <a name="miscellany">Miscellany</a>

To display usage summary, run:

    mkadm --help
