#!/bin/bash -e

cartridge_type='rsyslogd-2.0'
source "/etc/openshift/node.conf"
source ${CARTRIDGE_BASE_PATH}/abstract/info/lib/util

# Import Environment Variables
for f in ~/.env/*; do
  . $f
done

translate_env_vars

# Ensure arguments.
if ! [ $# -eq 1 ]; then
    echo "Usage: $0 [enable|reenable|disable|status|start|restart|stop]"
    exit 1
fi

validate_run_as_user

"${CARTRIDGE_BASE_PATH}/embedded/$cartridge_type/info/bin/rsyslogd_ctl.sh" $1