---
title: Spring Boot 手动部署脚本
date: 2022-03-25 00:12:57
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

## 解决windows环境生成脚本上传linux系统无法运行问题

### 如果未安装vim，需先安装

- ubuntu系统：普通用户下输入命令：sudo apt-get install vim-gtk
- centos系统：普通用户下输入命令：yum -y install vim*

### 具体步骤 

- 检查代码格式是否正确

```shell
cat -v xx.sh
```

- 用vim打开文件，在命令行输入，查看文件是unix格式还是dos

```shell
:set ff
```

- 如果是dos，则通过以下命令改变文件为unix模式

```shell
:set ff=unix
:wq
```