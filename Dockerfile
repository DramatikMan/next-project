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

FROM nginx/unit:1.23.0-python3.9 AS production

WORKDIR /srv/project
COPY --from=development /project/.venv .venv
COPY application application
COPY unit/webapp.py unit/webapp.py
COPY unit/config.json /docker-entrypoint.d/config.json
