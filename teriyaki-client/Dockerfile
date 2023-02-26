FROM ubuntu as builder
RUN apt-get -y update
RUN apt-get -y install dos2unix
RUN mkdir -p /work
COPY worker.sh /work
WORKDIR /work
RUN dos2unix worker.sh

FROM ubuntu
RUN apt-get -y update
RUN apt-get -y install jq curl wait-for-it wget gnupg
RUN wget -qO - https://www.mongodb.org/static/pgp/server-6.0.asc | apt-key add -
RUN echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/6.0 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-6.0.list
RUN apt-get -y update
RUN apt-get -y install mongodb-database-tools
COPY --from=builder /work /app
WORKDIR /app
CMD [ "bash", "worker.sh" ]
