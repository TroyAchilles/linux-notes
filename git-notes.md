# Git Introduction
    Git是由linus开发的分布式版本控制系统，不同于CVS、SVN的集中式。本文所有练习都是在fedora release 21上进行。
    文内只是记录对一些命令的使用心得。
## Install Git 安装Git
    yum install git.
## Git command introduction
- git help checkout
    查看checkout命令的使用，git help xxx 可以来搜寻git常用命令的用法
- mkdir gitpractice; cd gitpractice  
    在合适的地方创建一个目录并进入
- git init  
    初始化gitpractice成git仓库
- touch readme.md; git add readme.md  
    创建readme.md,并将readme.md加入暂存区
- git commit -m "add readme.md" readme.md  
    将暂存区的readme.md 修改加入版本库,在commit后会得到一个commit id。类似于svn的版本号
- git reset HEAD
    将暂存区恢复到当前版本，HEAD为当前版本，上一个版本为HEAD^，上上个为HEAD^^， 往上100个为HEAD～100
    这一步不会影响到工作区的内容，只是将暂存区恢复到某个版本，也就是说撤销了当前工作区add到暂存区的内容
    git reset HEAD 中的HEAD可以替换为任何commit id，不写时默认为HEAD
- git reset HEAD --hard
    将工作区和暂存区恢复到当前版本,即将工作区和暂存区回退到HEAD版本,注意和git reset HEAD的区别
    git reset HEAD --hard 中的HEAD可以替换为任何commit id，不写时默认为HEAD
    关于reset更详细的useage，参看git help reset
- git checkout 
    git checkout <file-name> 将file-name从index检出到 workstation, 即用index的file-name覆盖了workstation的file-name
    git checkout <branch-name> 将分支切换的branch-name, 就是将local repository中的branch-name 检出到workstation
    git checkout HEAD -- file-name 将版本HEAD 的filename检出到workstation和index 
- git branch
    git branch 查看分支信息
    git checkout -b branch-name 创建并切换到分支branch-name等效于 git branch branch-name; git checkout branch-name
    git branch -d branch-name 删除分支branch
- other
    git merge branch-name; 合并branc-name到当前分支
    git pull； 从remote repository 更新当前locoal repository、index、workstation
    git fetch； 从remote repository 更新local repository
    下图更清晰的描绘了git data tarnsport command：
