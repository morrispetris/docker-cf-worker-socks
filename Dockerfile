FROM node:21

WORKDIR /app

RUN apt-get update && apt-get install -y git jq net-tools \
    && git clone https://github.com/morrispetris/CF-Worker-Socks .

COPY update-config.sh .
COPY config.txt .

RUN chmod +x update-config.sh

RUN npm install

EXPOSE 1080/tcp

CMD ["sh", "update-config.sh"]
