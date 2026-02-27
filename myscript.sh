#!/bin/bash

LOGFILE="C:/Users/bitzl/projects/devops/sys_report_$(date +%Y-%m-%d_%H-%M-%S).log"
(
echo "Linux system health report -$(date)"
echo "---------------------------"
echo "System Uptime:"
uptime
echo "---------------------------"
echo "Disk Usage:"
df -h
echo "---------------------------"
echo "Memory Usage:"
free -h
echo "---------------------------"
echo "Top 5 Memory-Consuming Process:"
ps aux --sort=-%mem | head -n 6
echo "---------------------------"
if systemctl is-active --quiet ngnix; then
	echo "Ngnix is running"
else
	echo "Ngnix is not running"
fi

echo "---------------------------"

) |tee "$LOGFILE"
