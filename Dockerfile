FROM            debian:jessie

MAINTAINER      "Mikhail Stolyarov" <schnack.desu@gmail.com>

ENV             APP_VERSION=9.1 \
                APP_BUILD=7 \
                APP_STATIC_DIR=/opt/teamcity_agent \
                APP_LISTEN_PORT=9090

LABEL           description="TeamCity Agent" \
                version=$APP_VERSION \
                build=$APP_BUILD \
                url="https://www.jetbrains.com/teamcity/"
	
RUN             apt-get update \
                && apt-get install -y openjdk-7-jre-headless \
                && apt-get install -y wget \
                && wget -q -P /tmp https://download.jetbrains.com/teamcity/TeamCity-${APP_VERSION}.${APP_BUILD}.tar.gz \
                && tar -xzvf /tmp/TeamCity-${APP_VERSION}.${APP_BUILD}.tar.gz -C /tmp/ \
                && mv /tmp/TeamCity/buildAgent $APP_STATIC_DIR \
                && apt-get purge -y wget \
                && apt-get autoclean \
                && apt-get clean \
                && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* 

WORKDIR         $APP_STATIC_DIR

EXPOSE          $APP_LISTEN_PORT

CMD             bin/agent.sh run

