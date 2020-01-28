# My Neovim-config Doc

## 前言

在没有完整地阅读**README**之前，请不要直接复制我的配置文件，否则容易出错。

## Screenshot

![screenshot.png](https://i.loli.net/2020/01/22/TFA9WIRewzKM3vS.png)

## TOC

* [My Neovim-config Doc](#my-neovim-config-doc)
* [前言](#前言)
* [Screenshot](#screenshot)
* [依赖](#依赖)
	* [Basic](#basic)
	* [Fonts](#fonts)
	* [coc](#coc)
	* [其他](#其他)
* [1.基本映射](#1.基本映射)
	* [1.1LEADER键](#1.1LEADER键)
	* [1.2最基础的](#1.2最基础的)
	* [1.3重新映射的移动](#1.3重新映射的移动)
	* [1.4重新映射的编辑器命令](#1.4重新映射的编辑器命令)
* [2.窗口管理](#2.窗口管理)
	* [2.1分屏](#2.1分屏)
	* [2.2在窗口（分屏）之间移动光标](#2.2在窗口（分屏）之间移动光标)
	* [2.3调整窗口大小](#2.3调整窗口大小)
* [3.Tabe管理](#3.tabe管理)
* [4.插件](#4.插件)

	* [vim-startify （初始启动界面）](#vim-startify-（初始启动界面）)

	* [vim-airline（状态栏）](#vim-airline（状态栏）)

	* [space-vim-dark（一个主题）](#space-vim-dark（一个主题）)

	* [nerdtree（文件浏览）](#nerdtree（文件浏览）)

	* [vim-easymotion（快速移动）](#vim-easymotion（快速移动）)

	* [ctrlp（查找文件）](#ctrlp（查找文件）)

	* [coc（补全）](#coc（补全）)

	* [markdown-preview（markdown浏览）](#markdown-preview（markdown浏览）)

	* [vim-table-mode（markdown表格）](#vim-table-mode（markdown表格）)

	* [vim-commentary（快速注释）](#vim-commentary（快速注释）)

	* [ultisnips(代码片段)](#ultisnips(代码片段))
* [5.自定义代码输入](#5.自定义代码输入)

	* [5.1markdown](#5.1markdown)

* [respect](#respect)

## 依赖

### Basic



- [ ] nodejs

- [ ] npm

- [ ] yarn

- [ ] make

- [ ] cmake

- [ ] python

- [ ] pip

**Update your python client:**
```shell
$ python3 -m pip install --user --upgrade pynvim
```


### Fonts



- [ ] Source Code Pro(可选)

- [ ] powerline

- [ ] nerd-fonts-complete



## coc



- [ ] ctags

- [ ] fd

- [ ] ripgrep

- [ ] - [ ] 执行 `pip3 install flake8` (用于代码检查)



### 其他



- [ ] figlet(可选)


---
## 1.基本映射

### 1.1LEADER键

**`空格键`**

### 1.2最基础的

**i**切换到**`INSERT`**（插入模式）

**`S`**：保存当前文件(:w)

**`Q`**：退出(:q)

**`R`**：重新加载init.vim文件

### 1.3重新映射的移动

| 命令 | 功能             | 原命令 |
| ---- | ---------------- | ------ |
| u    | 光标向上移动一行 | k      |
| j    | 光标向下移动一行 | j      |
| h    | 光标向左移动     | h      |
| k    | 光标向右移动     | l      |
| U    | 光标向上移动5行  | 5k     |
| J    | 光标向下移动5行  | 5j     |
| 9    | 光标移动至行首   | 0      |
| 0    | 光标移动至行尾   | $      |

### 1.4重新映射的编辑器命令

| 快捷键              | 执行的操作                         |
| ------------------- | ---------------------------------- |
| L                   | 撤销                               |
| =                   | 跳转到下一个搜索                   |
| -                   | 跳转到上一个搜索                   |
| Y                   | 复制到系统剪切板（需要在可视模式） |
| `<SPACE>`+`<Enter>` | 取消高亮搜索                       |

***

## 2.窗口管理

### 2.1分屏

| 命令 | 功能                                       |
| ---- | ------------------------------------------ |
| su   | 新建一个水平分割的窗口，放置当前窗口上方   |
| sj   | 新建一个水平分割的窗口，放置当前窗口下方   |
| sh   | 新建一个垂直分割的窗口，放置在当前窗口左侧 |
| sk   | 新建一个垂直分割的窗口，放置在当前窗口右侧 |

### 2.2 在窗口（分屏）之间移动光标

| 快捷键              | 功能                   |
| ------------------- | ---------------------- |
| `<SPACE>`+`<up>`    | 将光标移动到上边的窗口 |
| `<SPACE>`+`<down>`  | 将光标移动到下边的窗口 |
| `<SPACE>`+`<left>`  | 将光标移动到左边的窗口 |
| `<SPACE>`+`<right>` | 将光标移动到右边的窗口 |

### 2.3调整窗口大小

使用方向键调整当前窗口大小

***

## 3.Tabe管理

| 命令 | 功能      |
| ---- | --------- |
| tu   | 创建新tab |
| tl   | 上一个tab |
| tn   | 下一个tab |

***

## 4.插件

### [vim-startify](https://github.com/mhinz/vim-startify) （初始启动界面）

### [vim-airline](https://github.com/vim-airline/vim-airline)（状态栏）

### [space-vim-dark](https://github.com/liuchengxu/space-vim-dark)（一个主题）

### [nerdtree](https://github.com/preservim/nerdtree)（文件浏览）

| 快捷键 | 行为       |
| ------ | ---------- |
| tt     | 打开文件树 |

### [vim-easymotion](https://github.com/easymotion/vim-easymotion)（快速移动）

| 快捷键   | 行为             |
| -------- | ---------------- |
| f{char}  | 某行直接快速移动 |
| ss{char} | 段落快速移动     |

### [ctrlp](https://github.com/kien/ctrlp.vim)（查找文件）

| 快捷键 | 行为     |
| ------ | -------- |
| C-p    | 查找文件 |

### [coc](https://github.com/neoclide/coc.nvim)（补全）

### [markdown-preview](https://github.com/iamcco/markdown-preview.nvim)（markdown浏览）

| 快捷键 | 行为           |
| ------ | -------------- |
| mp     | 打开浏览器预览 |

### [vim-table-mode](https://github.com/dhruvasagar/vim-table-mode)（markdown表格）

| 快捷键 | 行为                 |
| ------ | -------------------- |
| tm     | 进入自动表格排版模式 |

### [vim-commentary](https://github.com/tpope/vim-commentary)（快速注释）

| 快捷键 | 行为               |
| ------ | ------------------ |
| gcap   | 注释一段           |
| gcc    | 注释/取消注释      |
| gc     | 注释（在可视模式） |
| gcgc   | 取消一段注释       |

### [ultisnips](https://github.com/SirVer/ultisnips)(代码片段)

| 快捷键 | 行为 |
|--------|------|
| c-b    | 后缀 |
| c-z    |      |




***
## 5.自定义代码输入

### 5.1markdown

| 快捷键 | 呈现效果                                                 |
| ------ | -------------------------------------------------------- |
| `\n`   | ---                                                      |
| `\b`   | 文本 **加粗**                                            |
| `\s`   | 文本~~中划线~~                                           |
| `\i`   | 文本 *斜体*                                              |
| `\d`   | `代码块`                                                 |
| `\c`   | 大 `代码块`                                              |
| `\m`   | - [ ] 复选框                                             |
| `\p`   | 图片                                                     |
| `\a`   | [超链接](https://github.com/theniceboy/nvim/blob/master) |
| `\1`   | # 标题1                                                  |
| `\2`   | ## 标题2                                                 |
| `\3`   | ### 标题3                                                |
| `\4`   | #### 标题4                                               |
| `\l`   | --------                                                 |

`\f`跳转到至下一个 `<++>` (占位符)

`\w` 跳转至下一个 `<++>` (占位符) 然后帮你键入`Enter`

## respect

```
 _   _                   _                 
| | | |_   _  __ _ _ __ | |__   __ _  ___  
| |_| | | | |/ _` | '_ \| '_ \ / _` |/ _ \ 
|  _  | |_| | (_| | | | | | | | (_| | (_) |
|_| |_|\__,_|\__,_|_| |_|_| |_|\__,_|\___/ 

```

