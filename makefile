SHELL := bash
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules

.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
.RECIPEPREFIX +=

.PHONY: all build clean images

DIR := $(shell basename "$(shell pwd)")
NAME = mkcmd
DOCKERFILE = ./Dockerfile

ifndef SSH_PRIVATE_KEY
  override SSH_PRIVATE_KEY=${HOME}/.ssh/id_ed25519
endif

ifndef SSH_PUBLIC_KEY
  override SSH_PUBLIC_KEY=${HOME}/.ssh/id_ed25519.pub
endif

all: build
  echo all

build:
  docker build -f $(DOCKERFILE) -t $(NAME) .

clean:
  rm -rf dat

images: clean
  mkdir -p dat
  mkadm -n core --export-dump dat/miki-core.pg
  mkadm -n base -e rom@mimix.io
  mkadm -Tn base --snapshot-tarball dat/miki-base.tar.xz
  mkadm -Xn base