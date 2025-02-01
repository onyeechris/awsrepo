# base image
FROM node:14-alpine

# set working directory
WORKDIR /app

# add `/app/node_modules/.bin` to $PATH
ENV PATH /app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install
RUN npm install --save @fortawesome/fontawesome-svg-core 
RUN npm install --save @fortawesome/free-solid-svg-icons 
RUN npm install --save @fortawesome/vue-fontawesome


# ARG TMDB_V3_API_KEY
# ENV REACT_APP_BACKEND_SERVICE=""
# ENV VITE_APP_TMDB_V3_API_KEY=${92ee59f0c269799bc7ac1ad04bd49922}
# ENV VITE_APP_API_ENDPOINT_URL="https://api.themoviedb.org/3"


# add app
COPY . /app 
EXPOSE 3000

# start app
CMD ["npm", "start"]
