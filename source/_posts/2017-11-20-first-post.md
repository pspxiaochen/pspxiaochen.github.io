---
title: 第一篇post：庆祝博客搭建成功
date: 2017-11-17 
categories:
  - 其他
tags:
  - 教程
  - hexo
  - node
  - git
description: 记录博客搭建过程和感受
---

&emsp;&emsp;&ensp;我听中文音乐很少，先放一首比较喜欢的中文歌曲... &emsp; 《平凡之路》---朴树
<center>
<iframe frameborder="no" border="0" marginwidth="0" marginheight="0" width=330 height=86 src="//music.163.com/outchain/player?type=2&id=28815250&auto=0&height=66"></iframe>

<br>
</center>

---

# 前言
&emsp;&emsp;&ensp;一直想搭建自己的博客，但是一直没实践，只怪自己太懒。这次终于下定决心去实践，不过像我等小白来来回回折腾了好几天，本来想省点事直接在github上小改一下，谁知道老是出问题，一提交就收到Page build failure邮件，头疼的我差点放弃，最后狠下心来在本地安装了jekyll，一边调试一边修改，总算调通了，然后push到github，刷新主页，-_-，404找不到页面！妈呀，搜了好久解决办法，最后按照网上说的bundle update升级到了和github一样的最新版，这次报错了：MethedError：not find methed to_liquid for...想了半天，当前'github-pages'包的最新版是155,我把Gemfile中的'github-pages'改成了'github-pages', '~> 154'，也就是从默认的当前最新版本155降到了154,运行bundel exec jekyll serve，完美通过。。。我就郁闷了，原来这个jekyll-next主题已经不适用最新版的github-pages了。那怎么办呢，直接用hexo+next吧，索性静态页面就静态到底吧。

# 安装node和hexo（基于windows） 
- 安装node
  去nodejs官网下载32或者64位的 node 安装包，然后在Windows下安装 node ，安装完成后，添加 node 到系统 PATH 变量，然后 Win+r 打开运行窗口，输入 cmd 打开命令窗口，然后键入：
  ``` bash
  node -v
  ```
  查看node是否已经安装好,再键入
  ``` bash
  npm -v
  ```
- 安装Hexo
  这里先安装cnpm，以加快npm包的下载速度：
  ``` bash
  npm install -g cnpm --registry=https://registry.npm.taobao.org
  ```
  然后，安装hexo
  ``` bash
  $ cnpm install hexo -g
  ```
  打开cmd命令窗口,键入:
  ``` bash
  hexo -v
  ```
  查看hexo是否已安装好
 
# 安装git
&emsp;&emsp;&ensp;去git for windows下载32或者64位的 git 安装包，然后在Windows下安装 git ，安装完成后，添加 git 到系统 PATH 变量，然后 Win+r 打开运行窗口，输入 cmd 打开命令窗口，然后键入：
``` bash
git -v
```
查看git是否已经安装好

# 本地生成SSH key并添加到github
- 本地生成ssh key
  https每次push需要输入用户名和密码，为了以后部署方便，我们使用ssh提交，使用ssh需要配置添加SSH key，具体如下：
  打开 git bash，输入以下命令:
  ```bash
  $ cd ~
  $ ssh-keygen -C "your_computer_name"
  ```
  接着会提示输入文件名，默认就行了，Enter
  再接着会提示你输入两次密码，这个是push时候的密码，我们选择空密码，Enter
  没问题的话就成功了。
- 添加ssh key 到github
  ```bash
  $ clip < ~/.ssh/id_rsa.pub
  ```
  然后登录github，进入右上角Account Settings，然后点击菜单栏的SSH key进入页面添加key，
  点击Add SSH key按钮，把复制的SSH key代码粘贴到key所对应的输入框，点击确认，Title会默认使用你的”your_computer_name”。
- 测试该SSH key
  ```bash
  $ ssh -T git@github.com
  ```
  出现
  ```bash
  $ Hi " your-github-username "! You've successfully authenticated, but GitHub does not provide shell access.
  $ Connection to github.com closed.
  ```
  ok,搞定。
  
# 搭建博客
- 新建github pages仓库
  注册github账号
  然后新建一个仓库，仓库名称为 your-github-username.github.io，比如我的是pspxiaochen.github.io
  
- 搭建博客
  在本地磁盘新建一个blog文件夹，比如在D盘新建一个blog文件夹，然后进入blog文件夹，执行以下操作：
  右键打开 git bash，输入以下命令
  ```bash
  $ git clone git@github.com:spaceJmmy/spaceJmmy-blog-template
  $ cd spaceJmmy-blog-template
  $ cnpm install
  ```
  下载完成后,继续输入：
  ```bash
  $ hexo clean
  $ hexo s
  ```
  如果出现
  ```bash
  INFO  Start processing
  INFO  Hexo is running at http://localhost:4000/. Press Ctrl+C to stop
  ```
  说明启动成功，但是信息还是我的，所以接下来要修改配置博客了。
 
# 配置博客

## 修改站点配置文件 spaceJmmy-blog-template/_config.yml：
- 修改站点信息，将以下内容改成你自己的信息：
  ```bash
  # Site
  title: spaceJmmy的博客 #博客名
  subtitle: 纯真容易幸福，单纯就易满足 #博客副标题
  description: #给搜索引擎看的，对站点的描述，可以自定义
  author: spaceJmmy #作者名称
  ```
- 修改站点 URL ，将站点 URL 改成你自己的 URL：
  ```bash
  # URL
  ## If your site is put in a subdirectory, set url as 'http://yoursite.com/child' and root as '/child/'
  url: https://pspxiaochen.github.io
  root: /
  ```
- 修改部署备份信息：
  把两个 git@github.com:spaceJmmy/spaceJmmy.github.io.git 换成成你自己的 repo 地址。
  ```bash
  # Deployment
  deploy: 
    type: git
    repo: 
        github: git@github.com:spaceJmmy/spaceJmmy.github.io.git,master
    message: updated at {{ now("YYYY-MM-DD HH:mm:ss") }} 
  backup:
    type: git
    repository:
              github: git@github.com:spaceJmmy/spaceJmmy.github.io.git,src
    message: updated at {{ now("YYYY-MM-DD HH:mm:ss") }}
  ```
## 修改next主题配置文件 spaceJmmy-blog-template/themes/next/_config.yml：
- 修改 github 社交信息，将我的 GitHub 链接 https://github.com/spaceJmmy 改成你自己的链接：
  ```bash
  social:
    #LinkLabel: Link
    GitHub: https://github.com/spaceJmmy
  ```

## 更换站点图标和用户头像：
- 更换站点图标
  更换本地文件夹 spaceJmmy-blog-template/themes/next/source 下面的 favicon.ico ，换成你自己的站点图标，文件名不要改变。
  
- 更换用户头像
  更换本地文件夹 spaceJmmy-blog-template/themes/next/source/images 下面的 avatar.gif ，换成你自己的用户头像，文件名不要改变。

## 修改关于页面：
  修改文件夹 spaceJmmy-blog-template/source/about 下的 index.md 文件，改为你自己的 关于 页面。
  
## 测试配置是否成功
  在git bash中输入以下命令：
  ```bash
  $ hexo clean 
  $ hexo s
  ```
  浏览器打开 http://localhost:4000/ ，如果成功的话，你会发现你的博客已经呈现出你的信息了，吼吼，狂欢吧…… 不过，先别急，先把网站部署备份了再说：
  
---  
  
  OK，接下来部署备份你的网站，这时候在 bash 终端 Ctrl+C 停止服务器运行，然后输入：
  ```bash
  $ hexo d
  ```
  你会发现静态网站已经 push 到你 repo 的 master 分支了。浏览器打开 your-github-username.github.io 就能看到你的博客了，哈哈……
  继续，备份博客源码之前需要先删除当前目录下的 .git 文件夹，然后 bash　输入：
  ```bash
  hexo b
  ```
  你会发现网站源码已经备份到你 repo 的 src 分支了，至此，可以开心的庆祝啦，哈哈。
  
---

## 博客以后的常态化管理
   以后写博客只需要自己写一个 .md 文件，然后放到/source/_posts文件夹下，写好博客后，来个拉风的部署三部曲，呼呼：
   ```bash
   $ hexo clean #清空缓存
   $ hexo d #部署站点到master分支
   $ hexo b #备份站点源代码到src分支
   ```
   
## 换台电脑重新部署（记得添加新的SSH key）
   得益于前面的工作，换台电脑我们只需要clone仓库的src分支，然后重新生成hexo博客环境来撰写和发布post。
   ```bash
   $ git clone -b src git@github.com:your-github-username/your-github-username.github.io.git
   $ cd your-github-username.github.io
   $ cnpm install
   ```
   hexo环境搭建成功，然后 hexo s 本地预览，添加新的post，再按上述部署三部曲走起，呼呼…
   有时 hexo b 会报错，提示执行 git push，那就 git push，你会看到 push 成功，哈哈。
 
---

&emsp;&emsp;&ensp;至此大功告成，看着自己现在这个博客上线，心里确实美滋滋啊，haha。

---

&emsp;&emsp;&ensp;这个博客的搭建，要感谢很多人...
- 首先感谢github，提供了git pages来托管我们的博客，而且是免费的;
- 然后要感谢提供主题模板的开源贡献者，使得像我这样的小白能够用上这么高大上的博客;
- 最后要感谢我自己，能够下定决心克服搭建博客的困难，谁让我是小白呢，慢慢进步。。。







