###############################
# Build static site in Python #
###############################

# latest Python, explicitly
FROM python:3.10.6 AS builder

# set up code
RUN mkdir /code
COPY . /code/
WORKDIR /code

# set up
RUN pip3 install -r requirements.txt

# build site
RUN sus


#########################
# Serve site with Caddy #
#########################

# latest Caddy, explicitly
FROM caddy:2.5.2-alpine

# copy built site
COPY --from=builder /code/output /srv
