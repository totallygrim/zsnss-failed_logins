## nossh.sh -- Deny account SSH access temporarily on Zscaler NSS
## 20230723-1126 JGRIM: Initial

#!/bin/sh

group="_nossh"  # Group to place user to deny SSH access.
length="600"  	# Lock the account for this many seconds.

# Parse the user from the MONIT_DESCRIPTION passed as runtime variable
user=$(echo $MONIT_DESCRIPTION | awk -F 'exceeded for ' 'NF>1{ sub(/ .*/,"",$NF); print $NF }')

sndlog(){ /usr/bin/logger "$0: $1"; }
sshmod(){ /usr/sbin/pw groupmod $group $1 || exit 1; }

sndlog "info: blocking ssh access for user: $user"
sshmod "-m $user"

sndlog "info: user $user is blocked for $length seconds"
/bin/sleep $length

sndlog "info: restoring ssh access for user: $user"
sshmod "-d $user"

sndlog "info: finished and exiting normally"
exit 0

#end
