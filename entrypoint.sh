#!/bin/bash

echo "Launching XMRIG PROXY\n"

NR_WORKERS=${NR_WORKERS:-1}

WORKERS_LIST=""
for n in $(seq 1 ${NR_WORKERS}); do
	_port=$((1111 * n ))
	WORKERS_LIST="${WORKERS_LIST} --api-worker-id=${_port} --bind=0.0.0.0:${_port}"
done

POOL_URL=${POOL_URL:-pool.supportxmr.com:3333}
POOL_USER=${POOL_USER:-4B6mV3NGBkVFRExSZiAk4hELCCx9bFBbtDGuAmx9ddUoJbLbfvrL7MYGRt5xqiM7nw8hfkCmPP9gFGjC2WHA47AH3xM1LBR}
POOL_COIN=monero

/xmrig/xmrig-proxy \
--donate-level=0 \
${WORKERS_LIST} \
--url=${POOL_URL} \
--user=${POOL_USER} \
--coin=${POOL_COIN} \
--pass="$HOSTNAME-$((1 + $RANDOM % 10))" \
--keepalive
