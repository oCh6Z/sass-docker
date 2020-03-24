ARG NODE_VERSION
FROM node:${NODE_VERSION}

ARG GID_NAME
ARG UID_NAME
RUN addgroup ${GID_NAME} \
    && adduser --ingroup ${GID_NAME} --home /home/${UID_NAME} --disabled-password --gecos "" ${UID_NAME}
    
RUN npm upgrade -g \
    && npm install -g sass

WORKDIR /home/${UID_NAME}/_data

USER ${UID_NAME}
