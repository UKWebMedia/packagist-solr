FROM ubuntu:12.04

# update packages
RUN apt-get -y update

# Install Oracle Java 7
RUN apt-get -y install vim python-software-properties
RUN apt-get -y update && apt-get -y install default-jre

# Install Apache Solr
ENV SOLR_VERSION 3.6.2
ENV SOLR apache-solr-$SOLR_VERSION
ADD http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/$SOLR.tgz /opt/$SOLR.tgz
RUN tar -C /opt --extract --file /opt/$SOLR.tgz
RUN mv /opt/$SOLR /opt/solr

CMD mkdir /tmp/solr-config
ADD https://raw.githubusercontent.com/composer/packagist/master/doc/schema.xml /tmp/solr-config/schema.xml
ADD https://raw.githubusercontent.com/composer/packagist/master/doc/solrconfig.xml /tmp/solr-config/solrconfig.xml

RUN cd /tmp/solr-config && cp -f * /opt/solr/example/solr/conf/

# Run Apache Solr
WORKDIR /opt/solr
EXPOSE 8983
CMD ["/bin/bash", "-c", "cd /opt/solr/example; java -jar start.jar"]
