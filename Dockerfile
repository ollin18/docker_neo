from ollin18/senate_base_ubuntu

MAINTAINER Ollin Demian Langle Chimal <ollin.langle@ciencias.unam.mx>

ENV REFRESHED_AT 2017-11-26

ADD http://dist.neo4j.org/neo4j-community-3.3.0-unix.tar.gz /var/lib
RUN tar -xzvf /var/lib/neo4j-community-3.3.0-unix.tar.gz
RUN mv neo4j-community-3.3.0 /var/lib/neo4j

WORKDIR /var/lib/neo4j

VOLUME /data

ADD http://dist.neo4j.org/jexp/shell/neo4j-shell-tools_3.0.1.zip  /var/lib/neo4j/lib

RUN yes | unzip /var/lib/neo4j/lib/neo4j-shell-tools_3.0.1.zip -d /var/lib/neo4j/lib && rm /var/lib/neo4j/lib/*.zip

RUN chmod +x /var/lib/neo4j/lib/*.jar

WORKDIR /var/lib/neo4j

RUN wget https://github.com/neo4j-contrib/neo4j-apoc-procedures/releases/download/3.3.0.1/apoc-3.3.0.1-all.jar --directory-prefix=plugins

RUN mkdir graphml

VOLUME /data

COPY docker-entrypoint.sh /tmp/docker-entrypoint.sh
EXPOSE 7475 7476 7472

ENTRYPOINT ["/tmp/docker-entrypoint.sh"]

CMD ["neo4j"]