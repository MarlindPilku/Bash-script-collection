#!/bin/bash

# -c [arg] for number of counts

read -p "Enter IP address: " address

option=""
arg=""

while getopts :c: opt; do
case "$opt" in
c) option="$opt"
arg="$OPTARG";;
:) echo "Something"
exit 1;;
?) echo "Unknown option"
exit 1;
esac
done

if [ -z "$option" ] && [ -z "$arg" ];then
echo
else
echo "Option is $option"
echo "Argument is $arg"
fi

if [ -n "$address" ] && [ -n "$arg" ];then
ping -c "$arg" "$address" | tee ping.log
exit 0
elif [ -n "$address" ];then
ping -c 30 "$address" |tee ping.log
exit 0
else
echo "Provide Address"
exit 1
fi

