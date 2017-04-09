## FR2TXT

This script helps me to write french dictation exersices.

## Prerequisites
VirtualBox with GuestAdditions
Vagrant

## Install
One way to install this app is via Vagrant.
I've made some tests with two boxes:
* "geerlingguy/ubuntu1604"
* "terrywang/archlinux"


### Clone repository

```
git clone https://github.com/TeaTracer/fr2txt.git
cd fr2txt
```

###  Vagrant

```
vagrant up arch
vagrant snapshot push arch
vagrant ssh arch
sudo /vagrant/install.sh
```
or
```
vagrant up ubuntu
vagrant snapshot push ubuntu
vagrant ssh ubuntu
sudo /vagrant/install.sh
```

## Usage

```
sudo /vagrant/run.py file.wav -o result.txt
```
If you have mp3 file, use
```
ffmpeg -i file.mp3 file.wav
```

## Help

```
usage: run.py [-h] [-o [OUTPUT]] [-l {fr-FR,en-US}] [-w WIDTH] file

wav to text

positional arguments:
  file

optional arguments:
  -h, --help            show this help message and exit
  -o [OUTPUT], --output [OUTPUT]
                        output text file
  -l {fr-FR,en-US}, --lang {fr-FR,en-US}
  -w WIDTH, --width WIDTH
                        line width
```

### License

This project is licensed under the MIT License - see the [LICENSE.txt](LICENSE.txt) file for details

