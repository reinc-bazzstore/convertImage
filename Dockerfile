FROM python:3.8.5-slim

COPY requirements.txt /workspace/requirements.txt

RUN apt-get update && apt-get install -y sudo wget vim curl gawk make gcc bzip2

RUN wget https://repo.continuum.io/archive/Anaconda3-2023.09-0-Linux-x86_64.sh && \
    sh Anaconda3-2023.09-0-Linux-x86_64.sh -b  && \
    rm -f Anaconda3-2023.09-0-Linux-x86_64.sh && \
    curl -sL https://deb.nodesource.com/setup_18.x | bash -  && \
    apt-get install -y nodejs

ENV PATH $PATH:/root/anaconda3/bin

RUN pip install --upgrade pip
WORKDIR /workspace
RUN pip install -r requirements.txt
RUN pip install pandas_datareader
RUN pip install mplfinance
RUN pip install japanize-matplotlib

RUN wget --quiet http://prdownloads.sourceforge.net/ta-lib/ta-lib-0.4.0-src.tar.gz -O ta-lib-0.4.0-src.tar.gz && \
    tar xvf ta-lib-0.4.0-src.tar.gz && \
    cd ta-lib/ && \
    ./configure --prefix=/usr && \
    make && \
    make install && \
    cd .. && \
    pip install TA-Lib && \
    rm -R ta-lib ta-lib-0.4.0-src.tar.gz

CMD ["jupyter-lab", "--ip=0.0.0.0","--port=8888" ,"--no-browser", "--allow-root", "--LabApp.token=''"]
