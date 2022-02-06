# Based on python official image but set apk source to aliyun and install git
# arg:
#   PYVER: image tag, from https://hub.docker.com/_/python?tab=tags

# from python image
ARG PYVER=latest
# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:${PYVER}

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# exeute shell commands
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk add git && \
    mkdir /app

WORKDIR /app

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser
