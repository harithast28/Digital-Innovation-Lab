# Dockerfile for packaging flask-webapp
FROM python:3.6-slim

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

COPY requirements.txt /usr/src/app/
RUN pip install  -r requirements.txt

COPY . /usr/src/app

EXPOSE 8080

CMD [ "python", "./api.py" ]
