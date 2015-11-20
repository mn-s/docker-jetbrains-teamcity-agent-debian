FROM            debian:jessie

MAINTAINER      "Mikhail Stolyarov" <schnack.desu@gmail.com>

ENV             APP_VERSION=9.1 \
                APP_BUILD=4 \
                APP_STATIC_DIR=/opt/teamcity_agent \
                APP_LISTEN_PORT=9090

LABEL           description="TeamCity Agent" \
                version=$APP_VERSION \
                build=$APP_BUILD \
                url="https://www.jetbrains.com/teamcity/"
	
ADD             https://download.jetbrains.com/teamcity/TeamCity-${APP_VERSION}.${APP_BUILD}.tar.gz /tmp/teamcity.tar.gz

#COPY           TeamCity-${APP_VERSION}.${APP_BUILD}.tar.gz /tmp/teamcity.tar.gz

RUN             apt-get update \
                && apt-get install -y openjdk-7-jre-headless \
                && tar -xzvf /tmp/teamcity.tar.gz -C /tmp/ \
                && mv /tmp/TeamCity/buildAgent $APP_STATIC_DIR \
                && apt-get clean \
                && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* 

WORKDIR         $APP_STATIC_DIR

EXPOSE          $APP_LISTEN_PORT

CMD             bin/agent.sh run

