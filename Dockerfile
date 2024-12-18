FROM liferay/portal:7.4.3.112-ga112
USER root

##Https configuration with self-signed certificate on port 8443
RUN rm -f /opt/liferay/tomcat/conf/server.xml
COPY server.xml /opt/liferay/tomcat/conf/
COPY keystore.jks /opt/liferay

##Cluster configuration with DNS ping
COPY jgroupsliferay-transport.xml /opt/liferay/
COPY jgroupsliferay-control.xml /opt/liferay/

##Configuration for connection on elastic Search
COPY com.liferay.portal.search.elasticsearch7.configuration.ElasticsearchConfiguration.config /opt/liferay/osgi/configs/


##Configuration for Document Library
COPY com.liferay.portal.store.file.system.configuration.FileSystemStoreConfiguration.config /opt/liferay/osgi/configs/

##Configuration portal-ext.properties
COPY portal-ext.properties /opt/liferay/

##uncomment the lines below to add the modules and themes to the deploy
#COPY modules/* /opt/liferay/osgi/modules/
#COPY themes/* /opt/liferay/osgi/war/


RUN chown -R liferay. /opt/liferay
USER liferay


EXPOSE 8443