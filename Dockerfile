ARG build_env

FROM python:slim AS base
SHELL ["/bin/bash", "-c"]
WORKDIR /project
COPY Pipfile scripts ./
RUN ./pipenv_install.sh

FROM base as development
COPY application application
COPY tests tests
COPY .coveragerc .coveragerc
CMD pipenv run devserver

FROM base as production
COPY application application
CMD ./supervisord.sh
