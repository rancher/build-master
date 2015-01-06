## Docker image for running the master branches of Rancher.
-----------
This uses a Docker in Docker base image, and when you want to rebuild... restart the container.

###Usage
To build:
`docker build --rm -t rancher-mbr .`

To run:
`docker run -it --privileged -p 8080:8080`

The command that is run by default is `/opt/cattle/scripts/run`
This will checkout all of the repositories, build and fire up a container running on port 8080. This will be exposed out to the base contiainer.

# Simple workflow
Running this container will pull in all of the major dependencies on the master branch from the Rancher IO Github organization. Every time the container is restarted via:
`docker restart <container_id>` the container will pull down the latest changes from Github and rebuild if needed.

To override and/or use personal forks/branches, you can log into the container `docker exec -it <container_id> /bin/bash` and go to the appropriate working directory (cattle, python-agent, node-agent, etc.) and perform git operations. To make them stick `touch .manual` in any directory that you want to take control over, and `echo "true">.rebuild`. Doing this will disable the scripts automatic pull from the repository, and will rebuild if true. (Note if you do not want the build to occur `echo "false">.rebuild` in any manually controled repository)


###Advanced Configuration
Most people will never need to know this. In order to configure this image, you can set the following variables:

```
: ${CATTLE_REPO:="https://github.com/rancherio/cattle.git"}
: ${CATTLE_WORK_DIR:=cattle}
: ${CATTLE_COMMIT:=master}

: ${PYTHON_AGENT_REPO:="https://github.com/rancherio/python-agent.git"}
: ${PYTHON_AGENT_WORK_DIR:=python-agent}
: ${PYTHON_AGENT_COMMIT:=master}

: ${NODE_AGENT_REPO:="https://github.com/rancherio/node-agent.git"}
: ${NODE_AGENT_WORK_DIR:=node-agent}
: ${NODE_AGENT_COMMIT:=master}

: ${BUILD_TOOLS_REPO:="https://github.com/rancherio/build-tools.git"}
: ${BUILD_TOOLS_COMMIT:=master}

: ${CATTLE_UI_URL:="http://cdn.rancher.io/ui/latest/static/index.html"}
```

These will control which repository and branch to checkout when building.