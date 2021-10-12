FROM tomcat:9.0

EXPOSE 8080
COPY conf /usr/local/tomcat/conf
COPY webapps /usr/local/tomcat/webapps
COPY war /usr/local/tomcat/webapps
COPY certs /certs
COPY scripts /scripts
RUN chmod +x /scripts/*

ENTRYPOINT /scripts/entrypoint.sh
#CMD ["catalina.sh", "run"]
