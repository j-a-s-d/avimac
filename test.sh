#!/usr/bin/env bash

echo "-------------------"
echo $(date +%F_%T)
echo "-------------------"
bin/test_unix/test_unix 2>&1

