FROM ubuntu as builder
RUN apt-get -y update
RUN apt-get -y install wget patch
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/taiko-web.tar | tar -x --strip-components=1 --one-top-level=/work
WORKDIR /work
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/honke-assets.tar | tar -x --strip-components=1 --one-top-level=public/assets
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/updatev2-test10.patch | patch -p1

FROM nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /work/public /pub
