---
title: LeetCode 按序打印 - 云天
tags: []
date: 2019-11-01 11:25:00
---

【摘要】第1114题 解题思路 1.定义一个flag信号量及对象锁lock 2.定义三个方法first，second，third用来分别执行A,B,C三个线程，并且在run()前增加限制，执行后更新flag值。比如：first执行条件为flag=0（即C线程执行完），A线程执行完后，flag设置为1表示可以 [阅读全文](http://www.cnblogs.com/tqlin/p/11775977.html)