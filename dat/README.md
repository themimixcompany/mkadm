README
======

- miki-base.tar.xz
  - The default tarball used for upgrading a Miki instance.
- miki-core.postgres.xz
  - This file is used for initializing a Postgres instance.
  - This file must be available for for _mkadm_ and _Miki Desktop_.
  - The version for _Miki Desktop_ must be uncompressed.
- miki-desktop.tar.xz
  - The tarball used for creating a _Miki Desktop_ installation.
  - This file is generated from _Miki Desktop_ via make.
  - This file must be generated everytime _Miki Desktop_ is updated.
- node_modules-<OS>-miki-desktop.tar.xz
  - The `node_modules` directory of Miki Desktop for operating system <OS>.
- node_modules-<OS>-miki.tar.xz
  - The `node_modules` directory of Miki for operating system <OS>.
