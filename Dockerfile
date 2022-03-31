#
# Ghost Dockerfile
#
# https://github.com/dockerfile/ghost
#

# Pull base image.
FROM node:16

# Install Ghost
RUN \
  cd /tmp && \
  wget https://ghost.org/zip/ghost-latest.zip && \
  unzip ghost-latest.zip -d /ghost && \
  rm -f ghost-latest.zip && \
  cd /ghost && \
  npm install --production

# Install Google Drive Integration
RUN cd /ghost && \
    mkdir content/adapters/storage && \
    cd /ghost/content/adapters/storage && \
    git clone https://github.com/behoyh/ghost-google-drive.git && \
    cd ghost-google-drive && \
    npm install

RUN useradd ghost --home /ghost

# Add files.
ADD start.bash /ghost-start

# Set environment variables.
ENV NODE_ENV development

# Copy to override.
COPY ./data /ghost-override

# Define working directory.
WORKDIR /ghost

# Define default command.
CMD ["bash", "/ghost-start"]
