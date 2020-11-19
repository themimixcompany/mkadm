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

To create an instance with the following configuration,

- name: `goliath`
- email: `david@mimix.io`
- domain: `goliath.streamsharing.io`
- droplet name: `miki-goliath`
- firewall name: `miki-goliath-fw`
- allowed ip addresses:
  - self address (control center)
  - `73.6.24.189`
- allowed ports:
  - `22`
  - `80`
  - `443`

run:

    mkadm -n goliath -e david@mimix.io -fA 73.6.24.189.144

When the installation has finished, you’ll see a message containing the IP address of the instance. Use this IP address as the DNS A record for `goliath.streamsharing.io` using your domain registrar.

To do the same, but initialize the database with a PostgreSQL dump, run:

    mkadm -n goliath -e david@mimix.io -d ~/miki/dat/mimix-miki.pg

To do the same, but without database initialization, run:

    mkadm -n goliath -e david@mimx.io

To connect to goliath via SSH, run:

    mkadm -sn goliath

To connect to the SQL command line on goliath, run:

    mkadm -n goliath -Q

To load an SQL file, run:

    mkdam -n goliath -S file.sql

To list the contents of the `/tmp` directory on goliath, run:

    mkadm -n goliath -c "ls /tmp"

To expunge goliath, run:

    mkadm -xn goliath

To create a database dump from goliath, run:

    mkadm -n goliath --export-dump file.pg

To upload a database dump to goliath, run:

    mkadm -n goliath --import-dump file.pg

To list all the instances, run:

    mkadm -l


### <a name="miscellany">Miscellany</a>

To display usage summary, run:

    mkadm --help
