#!/bin/bash

while IFS=";" read -r url1 url2; do
    ret=$(curl -L -s -o /dev/null "$url1" -w "%{url_effective}\n")
    if [ "$ret" != "$url2" ]; then
      echo "Expected redirect from $url1 to $url2 but got $ret";
      exit 1
    fi
    retr=$(curl -s -L -o /dev/null -w "%{http_code}\n" "$ret")
    if [ "$retr" != "200" ]; then
      echo "Expected success status 200 from $ret, but got $retr";
      exit 1
    fi
done < test_local.csv