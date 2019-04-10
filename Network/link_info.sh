#!/bin/bash

tmpfile=$(mktemp)
netstat -anp | grep 'ESTABLISHED' | grep 'python' | grep 'tcp' | awk '{print $4,$5}' | grep -v '0.0.0.0'| awk -F '[:| ]' '$2>6000 && $2<9999{print $0}'  > ${tmpfile}
for port in `cat ${tmpfile} | awk -F '[:| ]' '{print $2}' | sort| uniq`
do
  num=$(grep ":${port} " ${tmpfile} | awk -F '[:| ]' '{print $3}' | sort |uniq| wc -l)
  echo "${port} ----> [${num}] $(grep ":${port} " ${tmpfile} | awk -F '[:| ]' '{print $3}' | sort |uniq |xargs | sed 's/ /,/g')"
done