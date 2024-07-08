#syntax=docker/dockerfile:1.8
FROM node as mjml
RUN <<EOF
npm install -g mjml@4.14.1
npm install -g pkg@5.8.1
pkg /usr/local/lib/node_modules/mjml/bin/mjml -t node18-linux-x64,node18-alpine-x64
EOF

FROM scratch
COPY --from=mjml /mjml-alpine /mjml
COPY --from=mjml /mjml-linux /mjml-linux
