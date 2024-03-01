# BASIC INSTALL
FROM jupyter/scipy-notebook:latest

COPY cert/ZscalerRootCertificate-2048-SHA256.crt /cert/ZscalerRootCertificate-2048-SHA256.crt
RUN pip config set global.cert "/cert/ZscalerRootCertificate-2048-SHA256.crt"

RUN pip install --no-build-isolation --force-reinstall \
    "boto3>=1.28.57" \
    "awscli>=1.29.57" \
    "botocore>=1.31.57"

RUN pip install  \
    "langchain>=0.0.350" \
    "transformers>=4.24,<5" \
    sqlalchemy -U \
    "faiss-cpu>=1.7,<2" \
    "pypdf>=3.8,<4" \
    pinecone-client==2.2.4 \
    apache-beam==2.52. \
    tiktoken==0.5.2 \
    "ipywidgets>=7,<8" \
    matplotlib==3.8.2 \
    anthropic==0.9.0

RUN pip install datasets==2.15.0
RUN pip install numexpr==2.8.8
RUN pip install --quiet \
    xmltodict==0.13.0  \
    duckduckgo-search  \
    yfinance  \
    pandas_datareader  \
    langchain_experimental \
    pysqlite3 \
    google-search-results
RUN pip install --quiet beautifulsoup4==4.12.2

RUN pip install --quiet "pillow>=9.5,<10"

USER root
RUN apt-get update && apt-get install g++ -y
USER 1000

RUN pip install -qU --no-cache-dir nemoguardrails==0.5.0

RUN pip install -qU "faiss-cpu>=1.7,<2" \
                      "langchain>=0.0.350" \
                      "pypdf>=3.8,<4" \
                      "ipywidgets>=7,<8"

