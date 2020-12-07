---
title: Spring Boot 2.4.0 发布说明
date: 2020-12-07 23:46:24
categories: 
- Java
tags:
- Spring Boot
---

Spring Boot 2.4.0 正式版本不再添加 RELEASE 后缀声明，在这个版本中增加了大量的新特性和改进，切记，不要轻易升级

除了刚发布的Spring Boot 2.4.0，Spring Boot 2.3.x/2.2.x仍旧是活跃的维护的版本。Spring Boot遵循的是Pivotal OSS支持策略，从发布日期起支持主要版本3年（注意：是主要版本）。下面是详情：

- 2.3.x：支持的版本。2020.05发布，是现在的活跃的主干
- 2.2.x：支持的版本。2019.10发布，是现在的活跃的主干
- 2.1.x：2018.10发布，支持到2020.10月底，建议尽快升级
- 2.0.x：2018.3发布，2019.4.3停止维护 
- 1.5.x：生命已终止的版本。2017.1发布，是最后一个1.x分支，2019.8.1停止维护

## 2.4.0主要新特性

### 版本命名的更改

从2.4.0开始，版本名将去除RELEASE后缀，所以这次的版本不是2.4.0.RELEASE，而是2.4.0

2.4.0是第一个使用新版本方案的Spring Boot发行版本

### 全新的配置文件处理(properties/yaml)

这个改变最为重磅，本次改变了配置文件的加载逻辑，旨在简化和合理化外部配置的加载方式，它可能具有不向下兼容性。

Spring Boot 2.4改变了处理application.properties和application.yml文件的方式：

- 若你只是简单的文件application.properties/yaml，那么升级对你是无缝的，你感受不到任何变化
- 若你使用了比较复杂的文件，如application-profile.properties/yaml这种（或者使用了Spirng Cloud的配置中心、（带有分隔符----的）多yaml文件），那么默认是不向下兼容的，需要你显式的做出些更改

因为配置文件隶属于程序的一部分，特别是我们现在几乎都会使用到配置中心。因此下面针对于老版本升级到Spring Boot 2.4.0做个简单的迁移指导。

Spring Boot 2.4对application.poperties/yaml的处理做了更新/升级。旨在简化和合理化外部配置的加载方式。它还提供了新功能：spring.config.import支持。所以呢，对于Spring Boot 2.4.0之前的版本（老版本）若升级到2.4.0需要做些修改，指导建议如下：

增加此配置后，Spring Boot对配置文件的解析恢复到原来模式：仍旧使用ConfigFileApplicationListener去解析

此API在2.4.0已被标记为过期，按照Spring Boot的版本策略，此类将在Spring Boot 2.6.0版本被移除。因此：若不是迫不得已（时间紧急），并不建议你用兼容手法这么去做，因为这将成为技术债，迟早要还的。

#### 方式一：恢复旧模式（不推荐）

如果你还未准备好做配置迁移的修改，Spring Boot也帮你考虑到了，提供了一键切换到旧模式的“按钮”。具体做法是：只需要在Environment里增加一个属性spring.config.use-legacy-processing = true就搞定。最简的方式就是把这个属性放在application.poperties/yaml里即可。

#### 方式二：按新规则迁移（推荐）

若你对配置文件的使用有如下情行，那么你需要做迁移：

- 多文档的yaml文件（带有----分隔符的文件）
- 在Jar外使用配置文件，或者使用形如application-{xxx}.properties/yaml这种配置
- 若在多文档yaml中使用到了spring.profiles配置项
- ...

Spring Boot 2.4.0升级对配置文件的改动是最大的，并且还不具备向下兼容性，简单的说就是从此版本开始要把Spring Boot的配置文件加载机制重学一遍（比如还增加了spring.config.import，增加了对kubernetes配置的支持等等），并且还要学会如何迁移。

### 新的 spring.config.import 属性可用于导入 Kubernetes 中常用的配置树

### 添加了一个新的启动端点，用来显示应用启动有关的详细信息，比如可以帮助我们来诊断启动时间比预期更长的 Spring Beans

### Docker 支持升级

### 完美支持Java 15

### 核心依赖升级

- Spring AMQP 2.3

- Spring Batch 4.3

- Spring Data 2020.0

- Spring Framework 5.3

- Spring Integration 5.4

- Spring HATEOAS 1.2

- Spring Kafka 2.6

- Spring Retry 1.3

- Spring Security 5.4

- Spring Session 2020.0

### 嵌入式数据库检测

改进嵌入式数据库检测机制：仅当数据库在内存中时才将其视为嵌入式数据库。所以如果使用H2、HSQL等产品，但是你是基于文件的持久性或使用的是服务器模式，那么将不会检测为内存数据库。而对于非内存数据库，你可能需要额外做如下动作：

- sa用户名将不会再被主动设置。所以如果你的数据库需要用户名，请增加配置项：spring.datasource.username = sa
- 这种数据库将不会再被自动初始化，若要使用请根据需要更改spring.datasource.initialization-mode的值

### Logback配置属性的更改

Logback一些配置项改名了,新增了配置类LogbackLoggingSystemProperties用于对应，它继承自之前的LoggingSystemProperties

之前的配置项有些被废弃（此版本还未删除，后续版本肯定会删除的），对应关系如下

|老(~~~已废弃~~~)|新|
|---|---|
|logging.pattern.rolling-file-name | logging.logback.rollingpolicy.file-name-pattern|
|logging.file.clean-history-on-start | logging.logback.rollingpolicy.clean-history-on-start|
|logging.file.max-size | logging.logback.rollingpolicy.max-file-size|
|logging.file.total-size-cap | logging.logback.rollingpolicy.total-size-cap|
|logging.file.max-history | logging.logback.rollingpolicy.max-history|

一些属性是被放到system environment里面的：
|老(~~~已废弃~~~)|新|
|---|---|
|ROLLING_FILE_NAME_PATTERN | LOGBACK_ROLLINGPOLICY_FILE_NAME_PATTERN|
|LOG_FILE_CLEAN_HISTORY_ON_START | LOGBACK_ROLLINGPOLICY_CLEAN_HISTORY_ON_START|
|LOG_FILE_MAX_SIZE | LOGBACK_ROLLINGPOLICY_MAX_FILE_SIZE|
|LOG_FILE_TOTAL_SIZE_CAP | LOGBACK_ROLLINGPOLICY_TOTAL_SIZE_CAP|
|LOG_FILE_MAX_HISTORY | LOGBACK_ROLLINGPOLICY_MAX_HISTORY|

### 不再注册DefaultServlet

从Spring Boot 2.4开始，默认将不会再注册DefaultServlet。因为在绝大多数的应用中，Spring MVC提供的DispatcherServlet是唯一需要被注册的Servlet。

    若你的工程强依赖于此Servelt，那么可以通过此配置项server.servlet.register-default-servlet = true把它注册上去。

### HTTP traces不再包含cookie头

默认情况下，不在 HTTP traces中包含 Cookie 请求头和 set-Cookie 响应头。

    若你仍旧想保留老的习惯，那么请用配置项management.trace.http.include = cookies, errors, request-headers, response-headers自行控制。

### 从spring-boot-starter-test中删除Vintage Engine

Spring Boot 2.2.0版本开始就引入JUnit 5作为单元测试默认库，在此之前，spring-boot-starter-test包含的是JUnit 4的依赖，Spring Boot 2.2.0版本之后替换成了Junit Jupiter（Junit5）。

Vintage Engine属于Junit5的一个模块，它的作用是：允许用JUnit 5运行用JUnit 4编写的测试，从而提供了向下兼容的能力。

从2.2.0到现在经过了2个版本的迭代，到Spring Boot 2.4.0这个版本决定了把Vintage Engine从spring-boot-starter-test正式移除。因此：若你的工程仍需要对JUnit4支持，那么请手动引入依赖项（如果工程量不大，强烈建议使用JUnit5，比4好用太多）

```xml
<dependency>
    <groupId>org.junit.vintage</groupId>
    <artifactId>junit-vintage-engine</artifactId>
    <scope>test</scope>
    <exclusions>
        <exclusion>
            <groupId>org.hamcrest</groupId>
            <artifactId>hamcrest-core</artifactId>
        </exclusion>
    </exclusions>
</dependency>
```
    说明：其实在2.4.0之前，若你是从https://start.spring.io生成的项目其实也是不会带有vintage-engine的。只不过它是通过显式的在pom里通过exclusion标签来排除的

## 资料

- [Spring Boot、Cloud学习示例](https://github.com/smltq/spring-boot-demo)
- [原文地址](https://github.com/smltq/blog/blob/master/source/_posts/issueGather/Spring%20Boot%202.4.0%20%E5%8F%91%E5%B8%83%E8%AF%B4%E6%98%8E.md)
- [参考资料](https://www.mdeditor.tw/pl/p5WO)
- [官网发布说明](https://github.com/spring-projects/spring-boot/wiki/Spring-Boot-2.4-Release-Notes)