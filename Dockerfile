FROM okteto/python:3

RUN wget -qO- https://binaries.cockroachdb.com/cockroach-v19.2.5.linux-amd64.tgz | tar  xvz && \
  cp -i cockroach-v19.2.5.linux-amd64/cockroach /usr/local/bin/ && \
  rm -rf cockroach-v19.2.5.linux-amd64

WORKDIR /usr/src/app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
COPY . . 

# This is used by the CLI
ENV COCKROACH_URL "postgresql://cockroachdb-public:26257?insecure=true"

ENV DATABASE_URL "cockroachdb://cockroachdb-public:26257/todo"

CMD python app.py