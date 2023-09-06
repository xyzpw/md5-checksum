#!/usr/bin/env bash

echo -ne "URI to File: "
read uri
echo -ne "File Name to Compare: "
read fileName

uriHash="$(curl -s $uri | md5sum | cut -d ' ' -f 1)"
fileNameHash="$(md5sum $fileName | cut -d ' ' -f 1)"

echo -e "\n"
if [[ "$uriHash" == "$fileNameHash" ]];
then
    echo -e "\033[32mMD5 hashes match!!!\033[0m"
else
    echo -e "\033[31mMD5 checksum failed!!!\033[0m"
fi
echo -e "\n"
echo "MD5 of $uri: $uriHash"
echo "MD5 of $fileName: $fileNameHash"
echo -e "\n"
