#!/usr/bin/env bash
mkdir ~/test
mv ~/files.tar.gz ~/test
cd ~/test
tar xvfz files.tar.gz
rm -rf files.tar.gz
cd 
clear
