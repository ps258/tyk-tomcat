#!/bin/bash

# create the server certs
if [[ ! -f tomcat-server.key && ! -f tomcat-server.crt ]]
then
  openssl req -x509 -newkey rsa:2048 -keyout tomcat-server.key -out tomcat-server.crt -days 365 -nodes -subj "/C=UK/ST=Scotland/L=Edinburgh/O=Home/OU=Garage/CN=localhost/emailAddress=tomcat-server@tom.cat"
else
  echo "[FATAL]tomcat-server.key and tomcat-server.crt must be removed first"
fi

if [[ ! -f tomcat-client.key && ! -f tomcat-client.crt ]]
then
  openssl req -x509 -newkey rsa:2048 -keyout tomcat-client.key -out tomcat-client.crt -days 365 -nodes -subj "/C=UK/ST=Scotland/L=Edinburgh/O=Home/OU=Garage/CN=localhost/emailAddress=tomcat-client-MTLS-cert@client.com"
else
  echo "[FATAL]tomcat-client.key and tomcat-client.csr must be removed first"
fi
