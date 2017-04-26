#!/bin/sh
echo "Start Master HA Manager..."

masterha_manager --conf=/etc/app1.cnf

sleep 60

exec "$@";