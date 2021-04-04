### ~ DEVELOPMENT ~ ###

FROM python:slim AS development

WORKDIR /project
COPY Pipfile .
RUN \
  pip install pipenv \
  && mkdir .venv \
  && pipenv install --dev --skip-lock
COPY . .
CMD pipenv run python app/server.py


### ~ PRODUCTION ~ ###
