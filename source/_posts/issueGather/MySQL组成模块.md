---
title: MySQL组成模块
date: 2019-12-27 00:12:57
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

## 管理服务组件和工具组件(Management Service & Utilities)

提供对MySQL的集成管理，如备份(Backup),恢复(Recovery),安全管理(Security)等

## 连接池组件(Connection Pool)

负责监听对客户端向MySQL Server端的各种请求，接收请求，转发请求到目标模块。每个成功连接MySQL Server的客户请求都会被创建或分配一个线程，该线程负责客户端与MySQL Server端的通信，接收客户端发送的命令，传递服务端的结果信息等

## SQL接口组件(SQL Interface)

接收用户SQL命令，如DML,DDL和存储过程等，并将最终结果返回给用户

## 查询分析器组件(Parser)

SQL命令传递到解析器的时候会被解析器验证和解析，首先分析SQL命令语法的合法性，并尝试将SQL命令分解成数据结构，若分解失败，则提示SQL语句不合理

## 优化器组件（Optimizer）

SQL语句在查询之前会使用查询优化器对查询进行优化。

## 缓存组件（Caches & Buffers）

如果查询缓存有命中的查询结果，查询语句就可以直接去查询缓存中取数据。这个缓存机制是由一系列小缓存组成的。比如表缓存，记录缓存，key缓存，权限缓存等

## 存储引擎（Engine）

MySQL属于关系型数据库，而关系型数据库的存储是以表的形式进行的，对于表的创建，数据的存储，检索，更新等都是由MySQL存储引擎完成的，这也是MySQL存储引擎在MySQL中扮演的重要角色。

MySQL之所以有多种存储引擎，是因为MySQL的开源性决定的。MySQL存储引擎，从种类上来说，大致可归结为官方存储引擎和第三方存储引起。MySQL的开源性，允许第三方基于MySQL骨架，开发适合自己业务需求的存储引擎。

### MySQL存储引擎作用

MySQL存储引擎在MySQL中扮演重要角色，其作比较重要作用，大致归结为如下两方面：

作用一：管理表创建，数据检索，索引创建等

作用二：满足自定义存储引擎开发。

### MySQL引擎种类

不同种类的存储引擎，在存储表时的存储引擎表机制也有所不同，从MySQL存储引擎种类上来说，可以分为官方存储引擎和第三方存储引擎。

当前，也存在多种MySQL存储引擎，如MyISAM存储引擎，InnoDB存储引擎，NDB存储引擎，Archive存储引擎，Federated存储引擎，Memory存储引擎，Merge存储引擎，Parter存储引擎，Community存储引擎，Custom存储引擎和其他存储引擎。

其中，比较常用的存储引擎包括InnoDB存储引擎，MyISAM存储引擎和Momery存储引擎。

## 物理文件（File System）

实际存储MySQL 数据库文件和一些日志文件等的系统，如Linux，Unix,Windows等。

物理文件包括：redolog、undolog、binlog（复制时还有relaylog）、errorlog、querylog、slowlog、data、index

## 资料

- [Java问题收集](https://github.com/smltq/blog/blob/master/source/_posts/issueGather/index.md)
- [原文地址](https://github.com/smltq/blog/blob/master/source/_posts/issueGather/MySQL%E7%BB%84%E6%88%90%E6%A8%A1%E5%9D%97.md)