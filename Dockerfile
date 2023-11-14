FROM python:3.9.16-slim

WORKDIR /workspace

COPY requirements.txt /workspace/requirements.txt

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY . /workspace