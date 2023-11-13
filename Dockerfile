FROM python:3.9.16-slim

WORKDIR /workspace

COPY . /workspace

RUN pip install --upgrade pip
RUN pip install -r requirements.txt

CMD ["/bin/bash"]