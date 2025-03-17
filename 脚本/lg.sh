#!/bin/bash
if [ "$#" -ne 1 ]
then
echo "没有传入日期参数！"
exit 1
fi

java -jar \
/opt/module/car-data/car-data-1.0.1-jar-with-dependencies.jar \
-c 1 \
    -o /opt/module/car-data/data \
    -d "$1" \
    -n root \
    -p 000000 \
    -u jdbc:mysql://hadoop102:3306/car_data
