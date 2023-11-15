# Git自动更新版本号的方法示例

#### 效果

在Git提交时自动更新`version.py`中版本号。

#### 使用方法

首次使用前，运行安装脚本。其中：

- Windows运行[`.githooks/git-hooks-intsall.bat`](./.githooks/git-hooks-intsall.bat)（以管理员身份）；
- Linux运行[`.githooks/git-hooks-intsall.sh`](./.githooks/git-hooks-intsall.sh)；

#### 原理

在`.git/hooks/`中实现Git规定的钩子`pro-commit`，其本质是一个[bash脚本](./.githooks/pre-commit)（即使在Windows上也是）。在Git提交时会自动调用该脚本（Windows调用安装Git for Windows时一并安装的mintty），可以利用该脚本更新文件。本项目利用该脚本调用了Python代码[`.githooks/update.py`](./.githooks/update.py)。

由于钩子的本体脚本文件无法保存在仓库中，因此将该脚本保存在[`.githooks/`](./.githooks/)中。在使用前运行[安装脚本](#使用方法)，通过创建符号链接的方法，将钩子所在目录映射到仓库的指定位置，继而实现管理钩子的脚本的同时Git可以调用该钩子。因为Linux和Windows的命令行工具、符号链接命令均不同，所以各自实现了一套脚本用于安装。
