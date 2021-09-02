FROM python:3.9

RUN apt-get update -y

WORKDIR /ticket_python_flask

RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/install-poetry.py | python - && \
    ln -s ~/.local/bin/poetry /usr/local/bin/poetry && \
    poetry config virtualenvs.create false

COPY ./pyproject.toml ./poetry.lock ./
RUN poetry install

COPY ./ticket_python_flask ./ticket_python_flask
COPY ./instance ./instance
COPY ./scripts ./scripts
COPY ./migrations ./migrations
COPY ./tests ./tests
COPY .env .env

RUN poetry install
CMD [ "./scripts/run-dev.sh" ]
