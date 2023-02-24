FROM ubuntu as builder
RUN apt-get -y update
RUN apt-get -y install wget patch
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/taiko-web.tar | tar -x --strip-components=1 --one-top-level=/work
WORKDIR /work
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/honke-assets.tar | tar -x --strip-components=1 --one-top-level=public/assets
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/updatev1.patch | patch -p1

FROM python
COPY --from=builder /work /runner
WORKDIR /runner
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1
CMD [ "python", "server.py", "34802", "-b", "0.0.0.0" ]
