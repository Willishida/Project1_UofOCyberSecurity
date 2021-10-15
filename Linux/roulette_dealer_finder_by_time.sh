#!/bin/bash

#Argument1=time of day; Argument2=AM/PM; Argument3=dealer schedule file 

grep "$1 $2" $3 | awk -F" " '{print $1,$2,$5,$6}'
