FROM node:16.15.1
WORKDIR /usr/src/app

COPY ["package.json", "yarn.lock", "npm-shrinkwrap.json*", "./"]

RUN yarn install --frozen-lockfile && mv node_modules ../

COPY . .

RUN npm run build
EXPOSE 3000

#RUN chown -R node /usr/src/app
#USER node
CMD ["npm", "start"]
