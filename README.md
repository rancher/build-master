## Docker image for running the master branches of Rancher.
-----------
This uses a Docker in Docker base image, and if you want speed, then you'll want to restart the internal container. 

###Usage
To build:
`docker build --rm -t rancher-mbr .`

To run:
`docker run -it --privileged -p 8080:8080`

The command that is run by default is `/opt/cattle/scripts/run`
This will checkout all of the repositories, build and fire up a container running on port 8080. This will be exposed out to the base contiainer.


###Configuration
In order to configure this image, you can set the following variables:

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