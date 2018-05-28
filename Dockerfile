FROM node:alpine
ENV DEBUG 'express:*'
RUN apk add --no-cache git vim \
    && mkdir -p /usr/src/app \
    && cd /usr/src/app \
    && git clone https://github.com/stephomi/sculptgl.git \
    && cd sculptgl \
    && npm install \
    && npm install webpack-cli@^1.5.3 webpack-dev-server@^2.9.5 --save-dev \
    && sed -ri -e "s!\\\\\\\\!/!g" /usr/src/app/sculptgl/package.json \
    && webpack

WORKDIR /usr/src/app/sculptgl
EXPOSE 8080
VOLUME ["/usr/src/app"]
CMD ["webpack-dev-server"]
