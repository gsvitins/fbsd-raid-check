#!/usr/bin/env bash
# Simple script that monitors FreeBSD software RAID1 and sends email notifications
# when array is in degraded mode.
# Change your emails and add to your crontab.


emails="email@example.com email2@example.com"

gmirror status | grep "COMPLETE" &>/dev/null

if [ $? -eq 0 ]; then
    exit 0
else
    for email in $emails
    do
        gmirror status | mail -s "$HOSTNAME RAID is DEGRADED!" "${email}"
    done
fi

