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

Scripts for creating Miki instances on DigitalOcean.


<a name="dependencies">Dependencies</a>
---------------------------------------

- doadm


<a name="usage">Usage</a>
-------------------------

### <a name="init">Initialization</a>

Before using this script, you must first authenticate with DigitalOcean. To do so, run:

    doadm -I


### <a name="instances">Instances</a>

To create a Miki instance with the name `miki`, domain `miki.mimix.io`, specifying the paths to the
resources at `/_assets/svg`, company name `miki`, company domain `mimix.io` installing it on a new
droplet named `miki-www-1` giving SSH access to the preconfigured SSH key
`6f:40:1c:47:98:d2:e8:03:05:e2:d2:f4:71:f3:ff:36` on the DO account, with a corresponding firewall
named `miki-fw-1`, initializing the database with the contents of `init.pg`, allowing access only
from `110.54.144.42`, and `73.6.24.189` on the ports `22`, `80`, and `443` from the input directory
`miki` on the current working directory, run:

```bash
mkadm \
-w miki -d miki.mimix.io -r /_assets/svg \
-c miki -o mimix.io \
-t -i /var/miki \
-k 6f:40:1c:47:98:d2:e8:03:05:e2:d2:f4:71:f3:ff:36 \
-D miki-www-1 \
-I init.pg \
-F miki-fw-1 \
-A 110.54.144.42,73.6.24.189 \
-P 22,80,443 \
miki
```

### <a name="miscellany">Miscellany</a>

To display usage summary, run:

    mdadm --help
