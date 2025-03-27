FROM node:16

COPY requirements.txt /tmp/requirements.txt

RUN apt-get update && \
    xargs apt-get install -y < /tmp/requirements.txt && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .
EXPOSE 5173
CMD ["npm", "start"]
