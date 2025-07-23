# use any reasonable Python image
FROM python:3.13 as build

# explicit work dir is important
WORKDIR /src

# copy all files
COPY . .

# install deps
RUN pip install -r requirements.txt

# run build process
RUN sus

# serve with Caddy
FROM caddy:alpine

# copy Caddy config
COPY Caddyfile /etc/caddy/Caddyfile

# copy generated static site
COPY --from=build /src/output /srv/
