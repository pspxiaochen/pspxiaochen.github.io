---
title: 线性回归与最小二乘法
date: 2018-07-03 12:27:00
categories:
  - 机器学习
tags:
  - 线性回归
mathjax: true
copyright: true
description: 当初学习线性回归的时候，知道了要优化损失函数，使损失函数要尽量的小。而损失函数就直接拿平方损失函数直接用，完全不知道为什么要用这个损失函数，慢慢的对这个问题感到好奇，查了资料才发现，确实是有一定道理的，我现在就来总结一下。
---
&emsp;&emsp;我们假设正确的结果y和我们的预测的输出函数有如下关系：

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$y^{(i)} = \theta^Tx^{(i)} + \epsilon^{(i)}$

在这里$\theta^Tx^{(i)}$为我们的预测函数，$\epsilon^{(i)}$是和真实值的误差。
因为每个样本都是独立的，因此误差直接也是独立的。所以我们假设$\epsilon^{(i)}$服从期望是0（我们希望没有误差）,方差是$\sigma^2$的高斯分布，记作$\epsilon^{(i)}\sim N(0,\sigma^2)$,而高斯分布的概率密度函数为：

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$P(x)=\frac{1}{\sqrt{2\pi}\sigma}exp(-\frac{(x-\mu)^2}{2\sigma^2})$
&emsp;&emsp;将误差带入上面的式子得：
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$P(\epsilon^{(i)})=\frac{1}{\sqrt{2\pi}\sigma}exp(-\frac{(\epsilon^{(i)})^2}{2\sigma^2})$

因为我们假设$\epsilon^{(i)}$服从期望是0（我们希望没有误差）,方差是$\sigma^2$的高斯分布。所以还可以假设$y^{(i)}$是服从期望是里$\theta^Tx^{(i)}$，方差为$\sigma^2$的高斯分布，在给定 x(i)且参数为 θ的情况下，记作：$y^{(i)}\sim N(\theta^Tx^{(i)},\sigma^2)$,所以我们可以将上面的式子改写为：
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$P(y^{(i)}|x^{(i)};\theta)=\frac{1}{\sqrt{2\pi}\sigma}exp(-\frac{(y^{(i)}-\theta^Tx^{(i)})^2}{2\sigma^2})$

因为在我们的样本中，y(i) 已经给定了，我们需要找到一个参数 θ，使得我们最有可能去得到 y(i)的分布。我们想要估计其中的未知参数θ。由此我们可以想到一个非常常用的参数估计方法--极大似然估计。
关于极大似然估计我推荐知乎的2篇文章，讲的浅显易懂。
[似然函数与极大似然估计][1]
[一文搞懂极大似然估计][2]

接着刚才，我们使用极大似然估计后可写成：
&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$L(\theta)=\prod_{i=1}^mP(y^{(i)}|x^{(i)};\theta) $

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$L(\theta)=\prod_{i=1}^m\frac{1}{\sqrt{2\pi}\sigma}exp(-\frac{(y^{(i)}-\theta^Tx^{(i)})^2}{2\sigma^2})$

因为是极大似然估计，所以我们希望$L(\theta)$要尽可能的大。所以我们对上面的式子取对数，因为对数不改变函数的单调性。

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$L(\theta)=\sum_{i=1}^m log\frac{1}{\sqrt{2\pi}\sigma}exp(-\frac{(y^{(i)}-\theta^Tx^{(i)})^2}{2\sigma^2})$

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$=mlog\frac{1}{\sqrt{2\pi}\sigma}+\sum_{i=1}^m -\frac{(y^{(i)}-\theta^Tx^{(i)})^2}{2\sigma^2}$

&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;$=mlog\frac{1}{\sqrt{2\pi}\sigma}-\sum_{i=1}^m \frac{1}{2\sigma^2}*(y^{(i)}-\theta^Tx^{(i)})^2$

为了使$L(\theta)$要尽可能的大，我们就需要让$J(\theta)=\frac{1}{2}*(y^{(i)}-\theta^Tx^{(i)})^2$尽量的小，所以就有了平方损失函数，可以看到是一模一样的。J(θ) 即为此线性回归的cost function。由此我们可以非常自然地推导出为什么线性回归中的cost function是使用最小二乘法。
接下来就是求解过程，常用的就是梯度下降，如果想知道为什么用梯度下降，请看这篇
[我自己理解的梯度下降原理][3]


  [1]: https://zhuanlan.zhihu.com/p/32568242
  [2]: https://zhuanlan.zhihu.com/p/26614750
  [3]: https://www.pspxiaochen.club/2018-05-24-GD/