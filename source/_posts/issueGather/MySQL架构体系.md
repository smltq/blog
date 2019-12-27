---
title: MySQL架构体系
date: 2019-11-22 00:12:57
categories: 
- 数据库
tags:
- mysql
- 架构
---

# MySQL基架大致包括如下几大模块组件

- （1）MySQL向外提供的交互接口（Connectors）

- （2）管理服务组件和工具组件(Management Service & Utilities)

- （3）连接池组件(Connection Pool)

- （4）SQL接口组件(SQL Interface)

- （5）查询分析器组件(Parser)

- （6）优化器组件（Optimizer）

- （7）缓存主件（Caches & Buffers）

- （8）插件式存储引擎（Pluggable Storage Engines）

- （9）物理文件（File System）

## MySQL向外提供的交互接口（Connectors）

Connectors组件，是MySQL向外提供的交互组件，如java,.net,php等语言可以通过该组件来操作SQL语句，实现与SQL的交互

## 资料

- [Java问题收集](https://github.com/smltq/spring-boot-demo/tree/master/java-gather)