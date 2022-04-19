#!/bin/bash
# 1.a
awk 'NF > 0' $1
# 1.b
uniq -u $1