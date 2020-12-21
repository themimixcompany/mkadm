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

run:

    mkadm -n goliath -e david@mimix.io

To do the same, but with the following firewall configuration:

- allowed ip addresses: self (control conter), `73.6.24.189`
- allowed ports: `22` , `80`, `443`

run:

    mkadm -n goliath -e david@mimix.io -fA 73.6.24.189.144

To connect to goliath via SSH, run:

    mkadm -n goliath -s

To connect to the SQL command line on goliath, run:

    mkadm -n goliath -S

To load an SQL file, run:

    mkdam -n goliath -F file.sql

To list the contents of the `/tmp` directory on goliath, run:

    mkadm -n goliath -c "ls /tmp"

To expunge goliath, run:

    mkadm -n goliath -x

To extract the database from goliath, run:

    mkadm -n goliath --dump-database file.pg.xz

To upload a database to goliath, run:

    mkadm -n goliath --restore-database file.pg.xz

To list all the instances, run:

    mkadm -l


### <a name="miscellany">Miscellany</a>

To display usage summary, run:

    mkadm --help
