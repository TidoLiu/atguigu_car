#!/bin/bash

case $1 in
"start"){
	for i in hadoop102 hadoop103 hadoop104
	do
	echo ---------- zookeeper $i started ----------
		ssh $i "/opt/module/zookeeper/bin/zkServer.sh start"
	done
};;
"stop"){
	for i in hadoop102 hadoop103 hadoop104
	do
	echo ---------- zookeeper $i stopped ----------
		ssh $i "/opt/module/zookeeper/bin/zkServer.sh stop"
	done
};;
"status"){
	for i in hadoop102 hadoop103 hadoop104
	do
	echo ---------- zookeeper $i status ----------
		ssh $i "/opt/module/zookeeper/bin/zkServer.sh status"
	done
};;
esac
