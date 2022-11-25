## Ghost Dockerfile


[Ghost](https://www.ghost.org/) for [Docker](https://www.docker.com/). Allows custom settings (databases, plugins) in a simple and easy-to-use Dockerfile.


### Base Docker Image

* [node](https://hub.docker.com/_/node)

## 1-Click Deploy

[![Run on Google Cloud](https://storage.googleapis.com/cloudrun/button.svg)](https://console.cloud.google.com/cloudshell/editor?shellonly=true&cloudshell_image=gcr.io/cloudrun/button&cloudshell_git_repo=https://github.com/behoyh/ghost.git)

### Installation

1. Install [Docker](https://www.docker.com/).

2. `docker run -p 80:80 behoyh/ghost`

   (alternatively, you can build an image from Dockerfile: `docker build -t="behoyh/ghost" github.com/behoyh/ghost`)

#### Customizing Ghost
   
   Add override files in the /data directory of the repo. Treat this as the root ghost folder. If you'd like to override content/data place a content folder like so:
   
   <img width="350" alt="image" src="https://user-images.githubusercontent.com/2565745/167858937-b102cbc4-9e67-4217-8edc-16980bb9a025.png">
   
(yes, it's a bit unintuitive to place `/content/data` in `/data`)

### Usage

    docker run -p 80:80 behoyh/ghost

After few seconds, open `http://<host>` for blog or `http://<host>/ghost` for admin page.
