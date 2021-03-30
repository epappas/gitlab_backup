#!/bin/bash

set -x

gitlab -o yaml project list --owned true --all | grep path_with_namespace | sed 's/[ \t]*//;s/path_with_namespace\: //' | uniq | sort > projects.list

cat projects.list | sed 's/\(.*\)/git clone -v git\@gitlab.com\:\1.git \1/' > gitclone.list
cat projects.list | sed 's/\(.*\)/git -C \1 fetch --all -v/' > gitfetch.list

cat gitclone.list | bash
cat gitfetch.list | bash

date
echo done
