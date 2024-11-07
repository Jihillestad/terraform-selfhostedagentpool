FROM mcr.microsoft.com/azure-cli:latest

WORKDIR /app

COPY ./tfgetarmkey.sh /app/tfgetarmkey.sh

RUN chmod +x /app/tfgetarmkey.sh
