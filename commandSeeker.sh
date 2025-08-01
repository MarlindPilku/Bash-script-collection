#!/bin/bash


# Finding executable files

IFS=':'
read -p "What command are you looking for? " command
for folder in $PATH;do
	for file in $folder/*;do
		if [ -x "$file" ];then
			if [ $(basename "$file") = "$command" ]; then
				echo "Command Found!"
				exit 0
			fi
		fi
	done
done

