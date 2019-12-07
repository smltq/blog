---
title: 数学公式
mathjax: true
date: 2019-12-06 00:12:57
categories: 
- 其它
tags:
- 数学
---

## 数列

### 等比数列

前N项和为 $S_n$，通项为$a_n$，公比为 $q$，且$a_1\not=0$。

- 当$q=1$时，则$S_n=na_1$

- 当$q\not=0$时，则$S_n=\cfrac{a_1(1-q^n)}{1-q}$

- $a_n=a_1*q^n$

- $a_n=a_mq^{n-m}$

### 等差数列

前N项和为 $S_n$，通项为$a_n$，公差为 $d$。

- $S_n=\cfrac{(a_1+a_n)*n}{2}$

- $a_n=a_1+(n-1)d$

- $a_n=a_m+(n-m)d$

## 解析几何

### 点到点距离

设两个点A、B以及坐标分别为 $A(x_1,y_1)、B(x_2,y_2)$，A和B两点之间的距离为 $d$。

则 $d=\sqrt{(x_1-x_2)^2+(y_1-y_2)^2}$

### 点到直线距离

直线的方程为 $l:Ax+By+c=0 ，A、B$ 均不为0，点的坐标为 $P(x_0，y_0)$，点 $P$ 到 $l$ 的距离为 $d$。

则 $d=\cfrac{|Ax_0+Bx_0+c|}{\sqrt{A^2+B^2}}$

### 两条平行线距离

直线的方程为 $l_1：Ax+By+c_1=0，l_2:Ax+By+c_2=0$，它们的距离为 $d$。

则 $d=\cfrac{|c_1-c_2|}{\sqrt{A^2+B^2}}$

## 立体几何

### 球体表面积

球体半径为 $r$，球体表面积为：$S$。

则 $S=4\pi r^2$

### 球体体积

球体半径为 $r$，体积为：$V$

则 $V=\cfrac{4}{3}\pi r^3$

## 示例

$\sqrt{xy}+\sqrt[a]{x}$

## 资料

- [数学公式语法](https://katex.org/docs/supported.html)
- [hexo-renderer-kramed插件](https://github.com/sun11/hexo-renderer-kramed)