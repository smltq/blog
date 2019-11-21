---
title: mysql 排它锁之行锁、间隙锁、后码锁 - 云天
tags: []
date: 2019-11-14 16:33:00
---

【摘要】MySQL InnoDB支持三种行锁定 行锁（Record Lock）:锁直接加在索引记录上面，锁住的是key。 间隙锁（Gap Lock）:锁定索引记录间隙，确保索引记录的间隙不变。间隙锁是针对事务隔离级别为可重复读或以上级别而设计的。 后码锁（Next Key Lock）：行锁和间隙锁组合起来就 [阅读全文](http://www.cnblogs.com/tqlin/p/11858273.html)