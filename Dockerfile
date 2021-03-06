FROM jetbrains/teamcity-agent:latest
LABEL maintainer="LolHens <pierrekisters@gmail.com>"


ENV TINI_VERSION 0.19.0
ENV TINI_URL https://github.com/krallin/tini/releases/download/v$TINI_VERSION/tini


USER root

RUN curl -Lo "/usr/local/bin/tini" $TINI_URL \
 && chmod +x "/usr/local/bin/tini"

USER buildagent


ENTRYPOINT ["tini", "-g", "--"]
CMD ["/run-services.sh"]

VOLUME /data/teamcity_agent/conf

