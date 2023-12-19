#syntax=docker/dockerfile:1.6
FROM node as mjml
RUN npm install -g mjml@4.14.1 && \
    npm install -g pkg@5.8.1 && \
    pkg /usr/local/lib/node_modules/mjml/bin/mjml -t node14-alpine-x64 -o /mjml

FROM scratch
COPY --from=mjml /mjml /mjml
