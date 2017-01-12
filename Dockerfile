#
# WSO2 API Manager
#
FROM openjdk:8
MAINTAINER Ivan Sim, ihcsim@gmail.com

ENV VERSION 2.1.0-RC2

RUN wget -P /opt https://github.com/wso2/product-apim/releases/download/v2.1.0-rc2/wso2am-${VERSION}.zip && \
apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2am-${VERSION}.zip -d /opt && \
    rm /opt/wso2am-${VERSION}.zip && \
    mv /opt/wso2am-${VERSION} /opt/wso2am

VOLUME ["/opt/wso2am/repository"]

EXPOSE 9443 9763 8243 8280 10397 7711
ENTRYPOINT ["/opt/wso2am/bin/wso2server.sh"]
