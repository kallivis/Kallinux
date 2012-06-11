#! /bin/bash

#get rvm
curl -L get.rvm.io | bash -s stable
source rvm
source ~/.rvm/scripts/rvm
#install ruby
rvm install 1.9.3
rvm use 1.9.3 --default
rvm 1.9.3

#install rails
gem install rails
