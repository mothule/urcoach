#!/bin/bash
cd  $(dirname `readlink $0`)
export PATH="/usr/local/rbenv/bin:$PATH"
eval "$(rbenv init -)"
ruby main.rb $*
