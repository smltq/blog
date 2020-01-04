---
title: Spring容器
date: 2020-01-04 00:12:57
categories: 
- Java
tags:
- Spring
---

## Spring容器是什么？

Spring容器是Spring的核心，Spring容器是管理bean对象的地方，其通过IoC技术管理。Spring容器也就是一个bean工厂（BeanFactory）。应用中bean的实例化，获取，销毁等都是由这个bean工厂管理的。更进一步讲，spring容器是管理service和dao的容器。

Spring提供了两种容器类型：BeanFactory和ApplicationContext

## BeanFactory

基础类型IoC容器，提供完整的IoC服务支持。如果没有特殊指定，默认采用延迟初始化策略（lazy-load）。只有当客户端对象需要访问容器中的某个受管对象的时候，才对该受管对象进行初始化以及依赖注入操作。所以，相对来说，容器启动初期速度较快，所需要的资源有限。

对于资源有限，并且功能要求不是很严格的场景，BeanFactory是比较合适的IoC容器选择。

## ApplicationContext

ApplicationContext在BeanFactory的基础上构建，是相对比较高级的容器实现，除了拥有BeanFactory的所有支持，ApplicationContext还提供了其他高级特性，比如事件发布、国际化信息支持等。ApplicationContext所管理的对象，在该类型容器启动之后，默认全部初始化并绑定完成。所以，相对于BeanFactory来说，ApplicationContext要求更多的系统资源，同时，因为在启动时就完成所有初始化，容器启动时间较之BeanFactory也会长一些。

在那些系统资源充足，并且要求更多功能的场景中，ApplicationContext类型的容器是比较合适的选择。

## 资料

- [Java问题收集](https://github.com/smltq/blog/blob/master/source/_posts/issueGather/index.md)
- [原文地址](https://github.com/smltq/blog/blob/master/source/_posts/issueGather/Spring%E5%AE%B9%E5%99%A8.md)