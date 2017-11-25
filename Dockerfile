FROM python:alpine

RUN pip install flower redis amqp

EXPOSE 5555

ENTRYPOINT [ "flower" ]
CMD [ "--port=5555" ]
