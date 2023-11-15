# Git自动更新版本号的方法示例

#### 效果

在Git提交时自动更新`version.py`中版本号。

#### 使用方法

首次使用前，运行安装脚本。其中：

- Windows运行[`.githooks/git-hooks-intsall.bat`](./.githooks/git-hooks-intsall.bat)（以管理员身份）；
- Linux运行[`.githooks/git-hooks-intsall.sh`](./.githooks/git-hooks-intsall.sh)；

#### 移植

将[`.githooks/`](./.githooks/)文件夹复制到需要的工程根目录下，按需求修改文件夹中的脚本和代码，并运行[安装脚本](#使用方法)。

#### 原理

在`.git/hooks/`中实现Git规定的钩子`pro-commit`，其本质是一个bash脚本（即使在Windows上也是）。在Git提交时会自动调用该脚本（Windows调用安装Git for Windows时一并安装的mintty），可以利用该脚本更新文件。本项目利用该脚本调用了Python代码[`.githooks/update.py`](./.githooks/update.py)。

由于钩子的本体脚本文件无法保存在仓库中，因此将该脚本保存在[`.githooks/`](./.githooks/)中。在使用前运行[安装脚本](#使用方法)，通过创建符号链接的方法，将钩子所在目录映射到仓库的指定位置，继而实现管理钩子的脚本的同时Git可以调用该钩子。因为Linux和Windows的命令行工具、符号链接命令均不同，所以各自实现了一套脚本用于安装。

#### 其他说明

脚本中使用的Python 3.x运行命令为大多数Linux系统上使用的`python3`，但是Windows和部分Linux中Python 3.x运行命令为`python`而没有`python3`，因此需要手动修改[`.githooks/pre-commit`]((./.githooks/pre-commit))（并且不要提交）。

#### 参考

1. [8.3 自定义 Git - Git 钩子](https://git-scm.com/book/zh/v2/%E8%87%AA%E5%AE%9A%E4%B9%89-Git-Git-%E9%92%A9%E5%AD%90)；
2. [8.3 Customizing Git - Git Hooks](https://git-scm.com/book/en/v2/Customizing-Git-Git-Hooks)；
