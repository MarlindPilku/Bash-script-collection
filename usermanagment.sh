#!/bin/bash

# Creating users from a file

file='users.csv'
IFS=','

while  read -r userid name
do
echo "adding $userid"
sudo useradd -c "$name" -m "$userid" 2> usererr.log
done < "$file"

