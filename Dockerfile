# base
FROM python:slim
WORKDIR ~/application

# virtual environment
COPY Pipfile .
RUN \
  pip install pipenv \
  && mkdir .venv \
  && pipenv install

# application
COPY app/ .
CMD pipenv run python server.py
