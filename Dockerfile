FROM python:2.7
MAINTAINER dan.leehr@duke.edu

ENV TZ=US/Eastern
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get install -y \
		gcc \
		gettext \
		mysql-client libmysqlclient-dev \
		postgresql-client libpq-dev \
		sqlite3 \
		python-psycopg2 \
	--no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /app
WORKDIR /app

ONBUILD COPY requirements.txt /app/
ONBUILD RUN pip install --no-cache-dir -r requirements.txt

ONBUILD COPY . /app
