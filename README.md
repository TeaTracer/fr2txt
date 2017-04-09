## FR2TXT

This script helps me to write french dictation exersices.

## Result

| input | output |
| ----- | ------ |
| Vincent a vu Nadia Ledoux dans la rue.| passants affluent nadia ledoux dans la rue |
| Elle lui a souri et, depuis, il est amoureux. | hélas ouvriers et depuis il est amoureux |
| Nadia est brune, elle a les yeux verts, les cheveux courts et bouclés. | nadia et brune hélas les yeux vers les cheveux courts et bouclée |
| C'est une jolie fille. | cette une jolie fille |
| Elle mesure 1 mètre 75. | elle mesure un mètre soixante quinze |
| Un producteur l'a remarquée et elle joue dans la dernier film de Bruno Ouzoulias. | à producteurs la remarquer quel jour dans le dernier fine de bruno vous souligne à ce qu' |
| Elle est sublime. | elle sublime |

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

