﻿---
title: 二叉搜索树的删除
categories: 数据结构
mathjax: true
copyright: true
date: 2018-07-14 10:40:29
description: 介绍一下二叉搜索树怎么删除节点。
---
#三种情况：
&emsp;&emsp;删除节点时二叉搜索树中最复杂的操作，但是删除节点在很多树的应用中又非常重要，所以详细研究并总结下特点。删除节点要从查找要删的节点开始入手，首先找到节点，这个要删除的节点可能有三种情况需要考虑：
1.该节点是叶子结点，没有孩子结点了。
2.该节点有一个孩子节点。
3.该节点有两个孩子节点。

第一种最简单，第二种也还是比较简单的，第三种就相当复杂了。下面分析这三种删除情况：

#第一种情况：
&emsp;&emsp;要删除叶子节点，只需要改变该节点的父节点对应子字段的值即可，由指向要删除的节点改为null就可以了。垃圾回收器会自动回收叶节点，不需要自己手动删掉；

#第二种情况：
&emsp;&emsp;当要删除的节点有一个子节点时，这个将要删除的节点只有2个连接：连向父节点和连向它唯一的子节点。我们需要间断这些连接，把它的子节点直接连接到它的父节点上即可，如果被删除的节点是父节点的左子节点，那么我就把要删除节点的子节点连接到被删除节点父节点的左子节点就行。右子节点同理。

#第三种情况：
&emsp;&emsp;第三种情况是最复杂的。如果要删除有两个子节点的节点，就不能只用它的一个子节点代替它。
因此需要考虑另一种方法，寻找它的中序后继来代替该节点。那么如何找后继节点呢？
&emsp;&emsp;首先得找到要删除的节点的右子节点，它的关键字值一定比待删除节点的大。然后转到待删除节点右子节点的左子节点那里（如果有的话），然后到这个左子节点的左子节点，以此类推，顺着左子节点的路径一直向下找，这个路径上的最后一个左子节点就是待删除节点的后继。如果待删除节点的右子节点没有左子节点，那么这个右子节点本身就是后继。（后继节点就是比这个要删除节点第一个大的数）。
&emsp;&emsp;找到后继节点我们就可以开始删除了。
##第一种情况：后继节点是需要删除节点的右节点的左后代，这种情况要执行以下四个步骤：
1.把后继的右子节点给后继节点的父节点的左孩子（leftChild)字段。
2.把要删除节点的右节点给后继节点的右孩子(rightChild)字段。
3.把待删除节点从它父节点的leftChild或rightChild字段删除，把这个字段置为后继；(如果删除的是左孩子字段就把左孩子字段设置成后继）。
4.将后继的leftChild字段置为待删除节点的左子节点。
##第二种情况：如果后继节点就是待删除节点的右子节点（这个后继节点肯定没有左孩子），这种情况比较简单，只需要把后继为根的子树移动到删除节点的位置即可。


样例和源码看这里
[二叉搜索树][1]


  [1]: https://blog.csdn.net/eson_15/article/details/51138663