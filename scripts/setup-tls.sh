#!/bin/bash

PATH=/usr/local/tomcat/bin:/usr/local/openjdk-11/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/scripts

# build the certs if they're missing. Better to use constant ones, but generate them if missing
if [[ ! -d /certs ]]
then
  echo "[INFO]/certs doesn't exist. Running on http"
  exit 0
fi

# /certs exists.
# backup the existing server.xml. It is the default which just uses http
cp /usr/local/tomcat/conf/server.xml /usr/local/tomcat/conf/server-no-tls.xml
cd /certs

if [[ -f tomcat-server.key && -f tomcat-server.crt ]]
then
  echo "[INFO]Server cert exists. Setting up https"
  # server certs exist, setup the keystore and start with TLS enabled
  # create tomcat-server.p12 from the given server cert
  openssl pkcs12 -export -name tomcat-server-cert -in tomcat-server.crt -out tomcat-server.p12 -inkey tomcat-server.key -passout pass:tomcat-server-cert-password

  # package the server cert so that java (tomcat) can read it
  keytool -importkeystore -destkeystore tomcat-server.jks -srckeystore tomcat-server.p12 -srcstoretype pkcs12 -alias tomcat-server-cert -srcstorepass tomcat-server-cert-password -deststorepass SERVER-123
  # copy the TLS config into place
  cp /usr/local/tomcat/conf/server-tls.xml /usr/local/tomcat/conf/server.xml
fi

if [[ -f tomcat-client.key && tomcat-client.csr ]]
then
  echo "[INFO]Client cert exists. Setting up MTLS"
  openssl pkcs12 -export -name tomcat-client-cert -in tomcat-client.crt -out tomcat-client.p12 -inkey tomcat-client.key  -passout pass:tomcat-client-cert-password
  keytool -importkeystore -destkeystore tomcat-client.jks -srckeystore tomcat-client.p12 -srcstoretype pkcs12 -alias tomcat-client-cert -srcstorepass tomcat-client-cert-password -deststorepass CLIENT-123
  # copy the MTLS config into place
  cp /usr/local/tomcat/conf/server-mtls.xml /usr/local/tomcat/conf/server.xml
fi
