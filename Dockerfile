FROM redis:3.2.3

RUN apt-get update && apt-get install -y wget \
    && wget https://github.com/jwilder/dockerize/releases/download/$DOCKERIZE_VERSION/dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && tar -C /usr/local/bin -xzvf dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz \
    && rm dockerize-linux-amd64-$DOCKERIZE_VERSION.tar.gz

COPY bin/run.sh /usr/local/bin/run.sh
COPY config/ /redis/config

ENTRYPOINT [ "bash", "-c" ]

CMD ["bash", "-c", "/usr/local/bin/run.sh"]
