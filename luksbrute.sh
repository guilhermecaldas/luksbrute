#!/bin/bash
#
#install dependencies:
#sudo apt install cryptsetup
#
#usage:
#sudo ./luksbrute.sh /path/to/dictionary.txt /dev/sdx
#
#
echo "Using dictionary file $1";
echo "Starting bruteforce for device $2";

cat $1 | while read i; do
  echo "Testing password: $i";
  echo $i | cryptsetup luksOpen $2 --test-passphrase -T1 2> /dev/null
  STATUS=$?
  if [ $STATUS -eq 0 ]; then
    echo ">>>>>>>>>Password found: $i"
    break
  fi
done
echo "Script finished";
