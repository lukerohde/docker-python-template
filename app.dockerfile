# BASIC INSTALL
FROM python:3.11-buster
RUN apt-get update -qq
RUN apt-get install -qq python3-pip

RUN adduser pyuser
USER pyuser

RUN mkdir /home/pyuser/app
WORKDIR /home/pyuser/app
COPY ./app /home/pyuser/app
RUN pip install --user --no-cache -r ./requirements.txt


