FROM node:latest

RUN mkdir -p /workdir/src
COPY package.json package-lock.json /workdir
COPY .eslintignore .eslintrc.js tsconfig.json /workdir
COPY ./src /workdir/src

WORKDIR /workdir
RUN npm install

ENTRYPOINT ["npx"]
