#!/bin/sh
echo "Start Master HA Manager..."

masterha_check_status --conf=/etc/app1.cnf

masterha_check_ssh --conf=/etc/app1.cnf

masterha_manager --conf=/etc/app1.cnf

masterha_check_status --conf=/etc/app1.cnf

sleep 600

exec "$@";