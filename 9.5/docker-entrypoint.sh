#!/bin/bash

set -e

echo "Create pghoard directories..."
mkdir -p /home/postgres/restore
chmod 700 /home/postgres/restore
mkdir -p /home/postgres/pghoard
chown -R postgres /home/postgres

echo "Set pghoard to maintenance mode"
touch /tmp/pghoard_maintenance_mode_file

echo "Create pghoard configuration with confd ..."
if getent hosts rancher-metadata; then
  confd -onetime -backend rancher -prefix /2015-12-19
else
  confd -onetime -backend env
fi

echo "Dump configuration..."
cat /home/postgres/pghoard.json

echo "Get the latest available basebackup ..."
gosu postgres pghoard_restore get-basebackup --config pghoard.json --site $PGHOARD_RESTORE_SITE --target-dir restore --restore-to-master --recovery-target-action promote --recovery-end-command "pkill pghoard"

echo "Start the pghoard daemon ..."
gosu postgres pghoard --short-log --config /home/postgres/pghoard.json &

echo "Start PostgresSQL ..."
exec gosu postgres postgres -D restore

