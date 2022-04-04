# Pull base image.
FROM node:lts-alpine

# Install Ghost
RUN \
  cd /tmp && \
  wget https://ghost.org/zip/ghost-latest.zip && \
  unzip ghost-latest.zip -d /ghost && \
  rm -f ghost-latest.zip && \
  cd /ghost && \
  npm install --production

# Install git
RUN apk add git

# Install Google Drive Integration
RUN cd /ghost && \
    mkdir content/adapters/storage && \
    cd /ghost/content/adapters/storage && \
    git clone https://github.com/robincsamuel/ghost-google-drive.git && \
    cd ghost-google-drive && \
    npm install

RUN adduser ghost -D --home /ghost

# Add files.
ADD start.sh /ghost-start

# Set environment variables.
ENV NODE_ENV development

# Copy to override.
COPY ./data /ghost-override

# Define working directory.
WORKDIR /ghost

# Define default command.
CMD ["sh", "/ghost-start"]
