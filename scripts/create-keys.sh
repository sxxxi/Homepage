#!/bin/sh

keyDir=$1
previousDir=$(pwd)

if [ ! -d $keyDir ]; then
  mkdir $keyDir
fi


cd "$keyDir"

# Generate private.der and public.der in the current directory
openssl genpkey -algorithm RSA -outform PEM -out private_key.pem

# Create a file with DER encoded, PKCS8 formatted private key
openssl pkcs8 -nocrypt -topk8 -inform PEM -in private_key.pem -outform DER -out private.der

# Create file containing DER encoded public key
openssl rsa -in private_key.pem -pubout -outform DER -out public.der

ls 

# remove pem
rm private_key.pem
cd $previousDir