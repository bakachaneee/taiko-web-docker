FROM ubuntu as builder
RUN apt-get -y update
RUN apt-get -y install curl patch
RUN curl https://specificsadgenericsoftware--lolichanx.repl.co/taiko-web.tar | tar -x --strip-components=1 --one-top-level=/work
WORKDIR /work
RUN curl https://specificsadgenericsoftware--lolichanx.repl.co/honke-assets.tar | tar -x --strip-components=1 --one-top-level=public/assets
RUN curl https://specificsadgenericsoftware--lolichanx.repl.co/updatev3-x.patch | patch -p1

FROM python
COPY --from=builder /work /runner
WORKDIR /runner
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1
CMD [ "python", "server.py", "34802", "-b", "*" ]
