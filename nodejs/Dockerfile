FROM node:10-stretch

LABEL maintainer="Luo Di <luodi0128@gmail.com> <https://github.com/lddsb>"

ARG CUSTOMIZE_MIRROR
# replace mirror
RUN if [ ${CUSTOMIZE_MIRROR} ]; then \
    sed -i 's/deb.debian.org/${CUSTOMIZE_MIRROR}/g' /etc/apt/sources.list \
    ;fi

ARG NODE_GULP=false
# install gulp
RUN if [ ${NODE_GULP} = true ]; then\
    yarn global add gulp \
    ;fi

# define variable
ARG NODE_SPECIAL_INSTALL
# other commands
ENV NODE_SPECIAL_INSTALL ${NODE_SPECIAL_INSTALL}
RUN if [ $NODE_SPECIAL_INSTALL ]; then \
    ${NODE_SPECIAL_INSTALL} \
    ;fi

COPY server.js /server.js

EXPOSE 8080
WORKDIR /app
CMD node /server.js
