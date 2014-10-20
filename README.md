vagrant.d
=========

A vagrant.d directory prepared for effortless use of the TechDivision Vagrant Chef cookbooks.

Installation:

- install Vagrant (http://www.vagrantup.com/)
- [[ -d ~/.vagrant.d ]] || mkdir .vagrant.d
- git clone git@github.com:techdivision/vagrant-home.git ~/.vagrant.d.new
- mv ~/.vagrant.d.new/* ~/.vagrant.d/
- mv ~/.vagrant.d.new/.* ~/.vagrant.d/
- rmdir ~/.vagrant.d.new
