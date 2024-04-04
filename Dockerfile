FROM python:3.12.2-alpine
LABEL maintrainer=""

ENV PYTHONNBUFFERED 1

WORKDIR cinema/

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY . .
RUN mkdir -p /files/media

RUN adduser \
    --disabled-password \
    --no-create-home \
    my-user

RUN chown -R my_user /files/media
RUN chmod -R 755 /files/media

USER my_user
