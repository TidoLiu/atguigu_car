#!/bin/bash
if [ $# -lt 1 ]
then
    echo "No Args Input..."
    exit ;
fi
case $1 in
"start")
        echo " =================== 启动 hadoop集群 ==================="

        echo " --------------- 启动 hdfs 和 yarn ---------------"
        ssh hadoop102 "/opt/module/hadoop/sbin/start-all.sh"
        echo " --------------- 启动 historyserver ---------------"
        ssh hadoop102 "/opt/module/hadoop/bin/mapred --daemon start historyserver"
;;
"stop")
        echo " =================== 关闭 hadoop集群 ==================="

        echo " --------------- 关闭 historyserver ---------------"
        ssh hadoop102 "/opt/module/hadoop/bin/mapred --daemon stop historyserver"
        echo " --------------- 关闭 hdfs 和 yarn ---------------"
        ssh hadoop102 "/opt/module/hadoop/sbin/stop-all.sh"
;;
*)
    echo "Input Args Error..."
;;
esac

