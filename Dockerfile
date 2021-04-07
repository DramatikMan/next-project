### ~ DEVELOPMENT ~ ###

FROM python:slim AS development

WORKDIR /project
COPY Pipfile .
RUN \
  pip install pipenv \
  && mkdir .venv \
  && pipenv install --dev --skip-lock
COPY . .
CMD pipenv run adev runserver application/__init__.py --app-factory create_app



### ~ PRODUCTION ~ ###
