FROM python:3.8-slim-buster@sha256:13af390c7ababf48b675e151c354de224f2ae6ec17ee08fe04ad3df8d0736501
RUN apt update && apt install curl make git libopenblas-base -y
RUN curl -sSL https://raw.githubusercontent.com/sdispater/poetry/master/get-poetry.py | python
ENV SHELL /bin/bash -l

ENV POETRY_CACHE /work/.cache/poetry
ENV PIP_CACHE_DIR /work/.cache/pip
ENV JUPYTER_RUNTIME_DIR /work/.cache/jupyter/runtime
ENV JUPYTER_CONFIG_DIR /work/.cache/jupyter/config

RUN $HOME/.poetry/bin/poetry config virtualenvs.path $POETRY_CACHE

ENV PATH ${PATH}:/root/.poetry/bin:/bin:/usr/local/bin:/usr/bin

CMD ["bash", "-l"]
