# Pull base image.
FROM node:16
ARG GHOST_VERSION=4.47.1

# Install sudo
RUN apt update && \
    apt install sudo -y

# Set ghost install user.
RUN useradd ghost-user --home /ghost --password '' && \
    usermod -aG sudo ghost-user
USER ghost-user

# Define working directory.
WORKDIR /ghost

# Install Ghost
RUN echo '' | sudo -S npm install ghost-cli@latest -g && \
    ghost install --db=sqlite3 --url http://mysite.com --no-prompt --no-stack --no-setup --no-start

# Install Google Drive Integration
RUN mkdir /ghost/versions/"$GHOST_VERSION"/content/adapters/storage && \
    cd /ghost/versions/"$GHOST_VERSION"/content/adapters/storage && \
    git clone https://github.com/robincsamuel/ghost-google-drive.git && \
    cd ghost-google-drive && \
    npm install

# Add files.
ADD start.bash /ghost-start

# Set environment variables.
ENV NODE_ENV development
ENV GHOST_VERSION $GHOST_VERSION

# Copy to override.
COPY ./data /ghost-override

#Set ghost-start user
USER root

# Define default command.
CMD ["bash", "/ghost-start"]
