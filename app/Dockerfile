FROM ubuntu as builder
RUN apt-get -y update
RUN apt-get -y install wget patch
RUN mkdir -p work
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/taiko-web.tar | tar -x --strip-components=1 -C /work
WORKDIR /work
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/honke-assets.tar | tar -x --strip-components=1 -C public/assets
RUN wget -O - https://specificsadgenericsoftware--lolichanx.repl.co/updatev1.patch | patch -p1

FROM python
COPY --from=builder /work /app
WORKDIR /app
RUN pip install -r requirements.txt
ENV PYTHONUNBUFFERED 1
CMD [ "gunicorn", "-b", "0.0.0.0:34801", "app:app" ]