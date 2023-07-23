## README.md
## 20230723-1150 JGRIM

Create a new group to place blocked accounts in. SSHd will block users in this group.

> pw groupadd _nossh

Start monit at boot. Append /etc/rc.local with:
> /usr/local/bin/monit

Copy the monitrc file to /etc/.
Copy the nossh.sh file to /usr/local/bin/.

Check if the monit config file is good.
> monit -t

Run monit.
> monit


