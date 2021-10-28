FROM node:latest

RUN mkdir -p /workdir/src /workdir/dist
COPY package.json package-lock.json /workdir
COPY .eslintignore .eslintrc.js tsconfig.json /workdir
COPY ./dist/manifest.json /workdir/dist
COPY ./src /workdir/src

WORKDIR /workdir
RUN npm install

ENTRYPOINT ["npx"]
