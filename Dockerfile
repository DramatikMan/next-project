ARG build_env

FROM python:slim AS base
SHELL ["/bin/bash", "-c"]
WORKDIR /project
COPY Pipfile scripts ./
RUN ./pipenv_install.sh

FROM base AS development
COPY . .
CMD pipenv run devserver

FROM base AS production
COPY application application
CMD ./supervisord.sh
