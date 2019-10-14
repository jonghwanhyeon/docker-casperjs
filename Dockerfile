FROM jonghwanhyeon/phantomjs

LABEL maintainer="hyeon0145@gmail.com"

ENV CASPERJS_VERSION 1.1.4-2

RUN apt-get update && apt-get install -y \
    python-minimal \
    curl \
&& rm -rf /var/lib/apt/lists/*

RUN curl --location https://github.com/casperjs/casperjs/archive/${CASPERJS_VERSION}.tar.gz | tar xz -C /usr/local/share/

RUN apt-get purge --auto-remove -y \
    curl

RUN ln -s /usr/local/share/casperjs-${CASPERJS_VERSION}/bin/casperjs /usr/local/bin

ENTRYPOINT ["casperjs"]
