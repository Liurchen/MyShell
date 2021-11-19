#! /bin/bash
#set path to support crontab
export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/usr/local/go/bin:/root/bin
# shutdown the pre process
if [ $1 -lt 1024 ]
then
	echo "port should more than 1024"
else
	name=$(lsof -i:$1|tail -1|awk '$1!=""{print $1}')
	if [ -z $name ]
	then
	        echo "No process can be used to killed!"
	else
		id=$(lsof -i:$1|tail -1|awk '$1!=""{print $2}')
		kill -9 $id
		echo "Process name=$name($id) kill!"
	fi
fi
exit 0
