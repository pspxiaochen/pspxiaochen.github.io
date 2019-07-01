---
title: 该死的牛客网输入。
date: 2018-06-25 21:27:00
categories:
  - code
mathjax: true
copyright: true
tags:
  - 笔试
description: 之前一直刷的是leetcode，前几天做了XX服的笔试题，我的天，第一道编程题的输入都让我弄了好久，难受。这次我总结一下Python的输入，以备将来笔试用。
---
# Python各种输入的方法。
##例一
&emsp;&emsp; 
输入：
```bash
4
7 15 9 5
```
可以看到 第一行的输入的数是第二行输入数字的个数。
```bash
import sys
line = sys.stdin.readline()
n = int(line) #读进来的都是str类型，需要转换成int类型
nums = [int(t) for t in sys.stdin.readline().split()]
```
在这里我们主要看一下第4行代码
```bash
nums = [int(t) for t in sys.stdin.readline().split()]
#这一行的输出是[7,15,9,5]
#我们现在把他拆解一下，如果写成这样
nums = sys.stdin.readline().split()
#现在这一行的输出变成了['7','15','9','5'],和之前的区别是现在list里每一个元素都是一个字符。
#如果再改成这样
nums = sys.stdin.readline()
#现在的输出就变成了7 15 9 5，注意这是一个str，比如nums[3]，就会输出5，当然5也是一个字符。
```

##例二
输入：
```bash
4 4
3332
3233
3332
2323
```
可以看到第一行的第一个4控制接下来输入的行数，第一行的第二个4控制接下来每一行的输入的元素。
```bash
import sys
m, n = [int(x) for x in sys.stdin.readline().split()]
nums = [[int(x) for x in sys.stdin.readline().strip()] for i in range(m)]
#重点看一下第3行的代码,相当于用了2层for循环
#外循环是运行m次int(x) for x in sys.stdin.readline().strip()，内循环是将每一行输入进来的str转换成int类型
#这一行将来的输出是一个二维数组
[[3, 3, 3, 2], [3, 2, 3, 3],[3, 3, 3, 2],[2, 3, 2, 3]]
```

目前还没看到别的不同的例子，如果今后碰到再补充。