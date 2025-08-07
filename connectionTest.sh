#!/bin/bash

# -c [arg] for number of counts
# -a [arg] for IP address

option=""
arg=""
address=""
while getopts :a:c: opt; do
case "$opt" in
a) address="$OPTARG";;
c) option="$opt"
arg="$OPTARG";;
:) echo "An argument is required"
exit 1;;
?) echo "Usage: "
echo "$? -a [IP Address] -c [Count]"
exit 1;;
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

