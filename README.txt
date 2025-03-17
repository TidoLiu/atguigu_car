atguigu_car/
├── README.txt
├── 脚本/
│   └── 放在~/bin目录的.sh脚本文件
└── 拦截器/
│   ├── 元文件
│   └── jar包，放在/opt/module/flume/lib目录
└── 配置文件/
    ├── Hadoop: core-site.xml, hdfs-site.xml, mapred-site.xml, yarn-site.xml
    ├── Kafka: server.properties
    ├── Flume: log4j2.xml, file_to_kafka.conf, kafka_to_hdfs.conf
    ├── DataX: car_info.json
    └── Hive: hive-site.xml
