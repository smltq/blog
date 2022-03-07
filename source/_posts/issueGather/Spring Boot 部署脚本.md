---
title: Spring Boot 部署脚本
date: 2022-03-07 00:12:57
categories: 
- Java

tags:
- Spring Boot
---
# Spring Boot 部署脚本

## 停止服务脚本（stop.sh）

```shell
#!/bin/bash
PID=$(ps -ef | grep jGit-0.0.1.jar | grep -v grep | awk '{ print $2 }')
        if [ -z "$PID" ]
        then
        echo Application is already stopped
        else
        echo kill $PID
        kill $PID
        fi
```

## 后台启动服务脚本（start.sh）

```shell
#!/bin/bash
nohup java -jar jGit-0.0.1.jar
```