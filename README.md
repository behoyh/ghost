## Ghost Dockerfile


This repository contains **Dockerfile** of [Ghost](https://www.ghost.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/dockerfile/ghost/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/nodejs](http://dockerfile.github.io/#/nodejs)

## 1-Click Deploy

[![Run on Google Cloud](https://storage.googleapis.com/cloudrun/button.svg)](https://console.cloud.google.com/cloudshell/editor?shellonly=true&cloudshell_image=gcr.io/cloudrun/button&cloudshell_git_repo=https://github.com/behoyh/ghost.git)

### Installation

1. Install [Docker](https://www.docker.com/).

2. Download [automated build](https://registry.hub.docker.com/u/dockerfile/ghost/) from public [Docker Hub Registry](https://registry.hub.docker.com/): `docker pull dockerfile/ghost`

   (alternatively, you can build an image from Dockerfile: `docker build -t="dockerfile/ghost" github.com/dockerfile/ghost`)


### Usage

    docker run -d -p 80:2368 dockerfile/ghost

#### Customizing Ghost

    docker run -d -p 80:2368 -v <override-dir>:/ghost-override dockerfile/ghost

where `<override-dir>` is an absolute path of a directory that could contain:

  - `config.js`: custom config file copied from [here](https://github.com/TryGhost/Ghost/blob/master/config.example.js) (you must replace `127.0.0.1` with `0.0.0.0`)
  - `content/data/`: persistent/shared data
  - `content/images/`: persistent/shared images
  - `content/themes/`: more themes

After few seconds, open `http://<host>` for blog or `http://<host>/ghost` for admin page.
