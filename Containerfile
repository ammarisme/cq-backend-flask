FROM python:3.7-alpine
COPY . /app
WORKDIR /app
RUN pip install .
RUN cq_backend_flask create-db
RUN cq_backend_flask populate-db
RUN cq_backend_flask add-user -u admin -p admin
EXPOSE 5000
CMD ["cq_backend_flask", "run"]
