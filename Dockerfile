#Use the node:10-alpine image as a base to
#create a directory for the app and its node_modules with node as its owner
#install all packages in package.json
#expose port 8080 and run the app
#the docker lecture will help you complete this file 
#there should be a total of 9 lines

# the base image to use
FROM node:10-alpine

# running the mkdir command to create a directory for the app
RUN mkdir -p /home/node/app && chown -R node:node /home/node/app

# set the owner of the /app directory to 'node'
RUN chown -R node:node /app

# setting the working directory
WORKDIR /home/node/app

# Copy package.json to the container
COPY package.json .

# Copy package-lock.json to the container
COPY package-lock.json .

# now we install those packages
RUN npm install

# Expose port 8080
EXPOSE 8080

# Run the app
CMD ["npm", "start"]