# redoc-cli in a container
#
# docker run --rm -it -o 8081:8081 -v $(pwd):/app\
# 	serve -p 8081 -w /app/swagger.yaml \
# 	adriagalin/redoc-cli
#

FROM node:alpine

LABEL MAINTAINER "Adrià Galín <@adriagalin>"

ENV REDOC_CLI_VERSION 0.4.0

# Install redoc-cli
RUN npm install -g redoc-cli@${REDOC_CLI_VERSION}

ENTRYPOINT [ "redoc-cli" ]
