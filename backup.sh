#!/bin/bash

set -x

gitlab -o yaml project list --owned true --all | grep path_with_namespace | sed 's/[ \t]*//;s/path_with_namespace\: //' | uniq | sort > projects.list

cat projects.list | sed 's/\(.*\)/git clone -v git\@gitlab.com\:\1.git \1/' > gitclone.list
cat projects.list | sed 's/\(.*\)/git -C \1 fetch --all -v/' > gitfetch.list
cat projects.list | sed 's/\(.*\)/git -C \1 pull --all -v/' > gitpull.list

cat gitclone.list | bash

while read line
do
  git -C $line branch -r | grep -v '\->' | while read remote; do git -C $line branch --track "${remote#origin/}" "$remote"; done
done < projects.list

cat gitfetch.list | bash
cat gitpull.list | bash

date
echo done
