#!/bin/bash

PATH=/usr/local/tomcat/bin:/usr/local/openjdk-11/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/scripts

if [[ ! -f /.initialised ]]
then
  /scripts/setup-env.sh > /.initialised
  /scripts/setup-tls.sh >> /.initialised
fi

catalina.sh run
sleep infinity
