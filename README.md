# FES-hub
**FES-hub** is a delicate program designed for automating the free energy simulation workflow. It aims at providing a one-for-all utility, and yet preserves the commands that carry out separated tasks.

* Author: Haoyu Lin
* E-mail: vileoy@pku.edu.cn
* Repo: [vileoy/FES-hub](https://github.com/vileoy/FES-hub)

## 1 Installation

This program is organized by shell scripts, and hence has no dependency problem. Please carry out the following commands to install it.

```bash
$ git clone https://github.com/vileoy/FES-hub.git
$ cd FES-hub
$ chmod +x install.sh
$ ./install.sh
```

## 2 Usage

It contains a one-for-all command `fes exec`, which amounts to a total of separated steps: `FESetup`, `fes prep`, `fes prod`, and `fes anal`. All `fes xxxx` commands possess a `-d` option that allows you to specify the working directory (default: pwd). Here are some instants show the details:

```bash
$ # Information
$ fes info -d /FES/WORK/DIR
```

```bash
$ # One-For-All
$ fes exec -d /FES/WORK/DIR
```

```bash
$ # File Format Convesion
$ fes conv -d /FES/WORK/DIR -f /RAW/FILE
```

```bash
$ # Preparation
$ fes prep -d /FES/WORK/DIR
```

```bash
$ # Production MD
$ fes prod -d /FES/WORK/DIR
```

```bash
$ # Analysis
$ fes anal -d /FES/WORK/DIR
```

