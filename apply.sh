#!/bin/bash

source ${CATTLE_HOME:-/var/lib/cattle}/common/scripts.sh

trap "touch $CATTLE_HOME/.pyagent-stamp" exit

cd $(dirname $0)

mkdir -p ${CATTLE_HOME}/bin

cp bin/volmgr bin/volmgr_mount ${CATTLE_HOME}/bin

chmod +x ${CATTLE_HOME}/bin/volmgr
chmod +x ${CATTLE_HOME}/bin/volmgr_mount