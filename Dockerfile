FROM node:18

RUN apt-get update && apt-get install -y python3 python3-pip

WORKDIR /app

COPY package*.json ./
RUN npm install

COPY . .

COPY requirements.txt ./

RUN pip3 install -r requirements.txt --break-system-packages

CMD [ "node", "/app/src/bot.js" ]