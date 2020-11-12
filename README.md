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
- [pgadm](https://github.com/themimixcompany/pgadm)


<a name="usage">Usage</a>
-------------------------

### <a name="init">Initialization</a>

Before using this script, you must first authenticate with DigitalOcean. To do so, run:

    doadm -I


### <a name="instances">Instances</a>

To create a Miki instance with the following configuration,

- name: `goliath`
- domain: `goliath.streamsharing.io`
- droplet name: `miki-goliath-www`
- firewall name: `miki-goliath-fw`
- allowed ip addresses:
  - `73.6.24.189`
- allowed ports:
  - `22`
  - `80`
  - `443`
- input directory: `~/miki/miki`

run:

    mkadm -in goliath -fA 73.6.24.189.144

When the installation has finished, you’ll see a message containing the IP address of the Miki instance. Use this IP address as the DNS A record for `goliath.streamsharing.io` using your domain registrar.

To do the same, but initialize the database with a PostgreSQL dump, run:

    mkadm -in goliath -I ~/miki/dat/mimix-miki.pg

To explicitly enable SSL on goliath, run:

    mkadm -n goliath --enable-ssl

To change the domain name of goliath to `goliath.mimix.io`, run:

    mkadm -n goliath --domain-name goliath.mimix.io

To get the date on goliath, run:

    mkadm -n goliath -c date

To connect to goliath via SSH, run:

    mkadm -sn goliath

To expunge `goliath`, run:

    mkadm -xn goliath


### <a name="miscellany">Miscellany</a>

To display usage summary, run:

    mkadm --help
