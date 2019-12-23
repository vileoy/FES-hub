# FES-hub
**FES-hub** is a delicate program designed for automating the free energy simulation workflow. It aims at providing a one-for-all utility, and yet preserves the commands that carry out separated tasks.

* Author: Haoyu Lin
* E-mail: vileoy@pku.edu.cn
* Repo: [vileoy/FES-hub](https://github.com/vileoy/FES-hub)

## 1 Installation

This program is organized by shell scripts, and hence has no dependency problem. Please carry out the following commands to install it.

```shell
$ git clone https://github.com/vileoy/FES-hub.git
$ cd FES-hub
$ chmod +x install.sh
$ ./install.sh
```

## 2 Usage

It contains a one-for-all command `fes exec`, which amount to a total of  `FESetup`, `fes prep`, `fes prod` separated steps. All `fes xxxx` commands possess a `-d` option that specifies the working directory (default: pwd). Some instants show the details:

```shell
$ # one-for-all
$ fes exec -d /FES/WORK/DIR
```

```shell
$ # Preparation
$ fes prep -d /FES/WORK/DIR
```

```shell
$ # Production MD
$ fes prod -d /FES/WORK/DIR
```

```shell
$ # Information
$ fes info -d /FES/WORK/DIR
```

