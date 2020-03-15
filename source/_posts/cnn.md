﻿---
title: 学习CNN时候的一些疑惑总结
categories: 机器学习
mathjax: true
copyright: true
date: 2018-07-21 11:21:59
description: 总结一下学习CNN时候的一些疑惑，只针对我个人。
---

##如何计算卷积层的输出尺寸：
输入矩阵格式：四个维度，依次为：样本数，图像高度，图像宽度，图像通道数（RGB就是3）
输出矩阵格式：四个维度，依次是，样本数，图像高度，图像宽度，图像通道数（后3个通道一般会发生变化）
权重矩阵（卷积核）格式：同样是四个维度，依次是，卷积核的高度，卷积核的宽度，输入通道数，输出通道数（卷积核个数）

计算公式是：
$height_{out} = (height_{in} - height_{kernel} + 2 * padding) / 步长 + 1$
$width_{out} = (width_{in} - width_{kernel} + 2 * padding) / 步长 + 1$

具体的细节可以参考链接[CNN中卷积层的计算细节][1]

## 如何计算池化层的输出尺寸：
输入矩阵格式：四个维度，依次为：样本数，图像高度，图像宽度，图像通道数
池化窗口的大小：一般取四个维度,依次是[1,height,width,1]因为我们不想在样本和图像通道上做池化，所以这两个维度设为了1。
计算公式是：
$height_{out} = (height_{in} - height_{filter}) / 步长 + 1$
$width_{out} = (width_{in} - width_{filter}) / 步长 + 1$

## 关于feature map的一些理解：
比如有一个32*32的RBG图像，这张图片在没有经过卷积之前有3张feature map，卷积核的大小是5*5，通道数是200，相当于是有200个卷积核，每个卷积核在原图像卷积得到一个featuremap,200个卷积核产生200个featuremap。

## 卷积层的作用：
我认为卷积层作用就是提取特征，不同的滤波器有不同的权重，可以提取不同的特征，比如说颜色深浅，图像的轮廓。

## 池化层的作用：
1. 不变性，更关注是否存在某些特征而不是特征具体的位置。可以看作加了一个很强的先验，让学到的特征要能容忍一些的变化。（包括平移，旋转，尺度。）
2. 减小下一层输入大小，减小计算量和参数个数
3. 获得定长输出。（文本分类的时候输入是不定长的，可以通过池化获得定长输出）
4. 防止过拟合或有可能会带来欠拟合。

## 如何理解卷积神经网络中的权值共享？
所谓的权值共享就是说，给一张图片，用一个滤波器去扫描，filter里面的参数就是权重，这张图的每个位置是被同样的filter扫的，所以权重是一样的，也就叫共享。

## 如何理解激活函数：
因为线性模型的表达能力不够，引入激活函数是为了添加非线性因素。

## 怎么计算CNN的参数个数，连接数个数，复杂度：
假设RGB图像的尺寸是32 * 32，滤波器的大小是 5 * 5，一共有200个滤波器，每个滤波器有1个bias参数，问有多少个训练参数，有多少连接，复杂度是多少？
训练参数：滤波器5*5*3=75,加上一个bias参数，一共是76个，一共有200个滤波器，所有一共有76*200=15200个参数。
连接个数：经过卷积之后的输出图像大小为 28*28，所以连接总数为：28*28*（5*5*3+1）*200

复杂度：时间复杂度即模型的运算次数。 
单个卷积层的时间复杂度：Time~O(M^2 * K^2 * Cin * Cout)

注1：为了简化表达式中的变量个数，这里统一假设输入和卷积核的形状都是正方形。 
注2：严格来讲每层应该还包含1个Bias参数，这里为了简洁就省略了。
M:输出特征图（Feature Map）的尺寸。
K:卷积核（Kernel）的尺寸。
Cin:输入通道数。
Cout:输出通道数。

##全连接层的作用：
全连接层之前的东西都是对提取的特征做各种处理，而到了全连接层我相当于对之前提取的特征做了一个全卷积的操作，比如我的全连接层输出是1000，那么这1000代表对1000种特征进行分类（有或者没有）最后在进行最终的分类。
  [1]: https://blog.csdn.net/dcrmg/article/details/79652487