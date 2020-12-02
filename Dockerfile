# Container is based on node 15
FROM node:15

# Create work dir
WORKDIR /usr/src/app

# Copy all files from repo (except the ones from .dockerignore) to container
COPY . .

# Grab dependencies in container
RUN npm install

# Expose Port
EXPOSE 6666

# Run app
CMD [ "node", "app.js" ]
