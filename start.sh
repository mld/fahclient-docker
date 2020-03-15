#!/bin/bash

ARGS="--run-as fahclient"

MY_POWER=${POWER:-full}
MY_USERNAME=${USERNAME:-Anonymous}
MY_PASSKEY=${PASSKEY:-}
MY_EXTRA=${EXTRA:-}
# not empty or unset (-e TEAM= to set no team)
[ ! "${TEAM+x$TEAM}" = "x" ] && MY_TEAM=${TEAM:=238593}
MY_NVIDIA=${NVIDIA:-}

ARGS="$ARGS --power=$MY_POWER --user=$MY_USERNAME"
[ $MY_TEAM ] && ARGS="$ARGS --team=$MY_TEAM"
[ $MY_PASSKEY ] && ARGS="$ARGS --passkey=$MY_PASSKEY"
[ $MY_EXTRA ] && ARGS="$ARGS $MY_EXTRA"

[ $MY_NVIDIA ] && [ ! -x /usr/bin/nvidia-smi ] && {
    # NVIDIA=440.64.00
    wget -q http://us.download.nvidia.com/tesla/$MY_NVIDIA/NVIDIA-Linux-x86_64-$MY_NVIDIA.run
    chmod +x NVIDIA-Linux-x86_64-$MY_NVIDIA.run
    ./NVIDIA-Linux-x86_64-$MY_NVIDIA.run -s --no-kernel-module
}

/usr/bin/FAHClient $ARGS
