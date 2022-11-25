## Ghost Docker

The purpose of this repo is to provide an easy and repeatable way to customize a ghost install.

Any themes, settings, routes, redirects, ect will be written to the ghost install as if it was in the ghost root directory. This is useful because a ghost install may require some setup and switching providers would only require a image pull.

You can test out a ghost install on your local machine, for example and deploy to a virtual machine or a rasberry pi for production.


### Base Docker Image

* [node](https://hub.docker.com/_/node)

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
