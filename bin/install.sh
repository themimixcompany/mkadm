#!/usr/bin/env bash

set -eu
set -o pipefail

readonly SELF=$(basename "${BASH_SOURCE[0]}")
readonly SELF_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" >/dev/null 2>&1 && pwd)"
readonly VERSION=1.0.0

readonly OPT_BASE_NAME=${SELF}

OPT_HELP=
OPT_DEBUG=
OPT_VERBOSE=

function error () {
  if [[ "${OS}" == "Darwin" ]]; then
    echo "error: ${@}" >&2
  else
    echo -e "\e[0;31m\e[1merror: \e[0;0m${@}" >&2
  fi

  exit 1
}

function warn () {
  if [[ "${OS}" == "Darwin" ]]; then
    echo "warning: ${@}" >&2
  else
    echo -e "\e[0;33mwarning: \e[0;0m${@}" >&2
  fi
}

function debug () {
  if [[ -n "${OPT_DEBUG}" ]]; then
    echo '**'
    echo \${@}: ${@}
    echo \$OPT_DEBUG: "${OPT_DEBUG}"
  fi
}

function parse_arguments () {
  debug ${FUNCNAME[0]} "$@"

  local opts=$(getopt -n "${SELF}" --options hdv --longoptions help,debug,verbose -- "$@")

  if [[ $? != 0 ]]; then
    error "Failed to parse arguments. Exiting."
  fi

  eval set -- "${opts}"

  while true; do
    case "$1" in
      (-h|--help) OPT_HELP=true; shift ;;
      (-d|--debug) OPT_DEBUG=true; shift ;;
      (-v|--verbose) OPT_VERBOSE=true; shift ;;
      (--) shift; break ;;
      (*) break ;;
    esac
  done

  OPT_WORK_DIR="${@: -1}"
}

function process_arguments () {
  debug ${FUNCNAME[0]} "$@"

  if [[ -n "${OPT_HELP}" ]]; then
    display_usage
  else
    return 0
  fi
}

function display_usage () {
  debug ${FUNCNAME[0]} "$@"

  cat << EOF
${SELF} v${VERSION} [OPTIONS]...

OPTIONS:
  -h, --help            Show this help
  -d, --debug           Enable debugging mode
  -v, --verbose         Enable verbose output
EOF
  exit 0
}

function install_node_js () {
  debug ${FUNCNAME[0]} "$@"

  curl -sL https://deb.nodesource.com/setup_15.x | sudo -E bash -
  apt-get install -y nodejs build-essential
}

function install_postgres () {
  debug ${FUNCNAME[0]} "$@"

  apt-get install -y postgresql postgresql-contrib
  sudo -u postgres psql --file=/var/miki/sql/init.sql
}

function install_miki_service () {
  debug ${FUNCNAME[0]} "$@"

  cp "${SELF_DIR}/miki.service" /etc/systemd/system
  chmod root:root /etc/systemd/system/miki.service
}

function start_miki_service () {
  debug ${FUNCNAME[0]} "$@"

  systemctl daemon-reload
  systemctl start miki
}

function main () {
  debug ${FUNCNAME[0]} "$@"

  parse_arguments "$@"
  process_arguments "$@"

  install_node_js
  install_postgres
  install_miki_service
  start_miki_service
}

main "$@"
