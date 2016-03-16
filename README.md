## Docker image for running the master branches of Rancher.
-----------
This uses a Docker in Docker base image, and when you want to rebuild... restart the container.

###Usage
To build:

`docker build --rm -t rancher-dev-container .`

To run the locally built version:

`docker run -d --privileged -p 8080:8080 --name=rancher-dev-container rancher-dev-container`

The command that is run by default is `/opt/cattle/scripts/run`
This will checkout all of the repositories, build and fire up a container running on port 8080. This will be exposed out to the base contiainer.

To run the version in Docker Hub:

`docker run -d --privileged -p 8080:8080 rancher/build-master:latest`

# Simple workflow
Running this container will pull in all of the major dependencies on the master branch from the Rancher IO Github organization. Every time the container is restarted via:
`docker restart <container_id>` the container will pull down the latest changes from Github and rebuild if needed.

To override and/or use personal forks/branches, you can log into the container `docker exec -it <container_id> /bin/bash` and go to the appropriate working directory (cattle, python-agent, node-agent, etc.) and perform git operations. To make them stick `touch .manual` in any directory that you want to take control over.


###Advanced Configuration
Most people will never need to know this. In order to configure this image, you can set the following variables:

```
: ${CATTLE_REPO:="https://github.com/rancher/cattle.git"}
: ${CATTLE_WORK_DIR:=cattle}
: ${CATTLE_COMMIT:=master}

: ${PYTHON_AGENT_REPO:="https://github.com/rancher/python-agent.git"}
: ${PYTHON_AGENT_WORK_DIR:=python-agent}
: ${PYTHON_AGENT_COMMIT:=master}

: ${HOST_API_REPO:="https://github.com/rancher/host-api.git"}
: ${HOST_API_WORK_DIR:=host-api}
: ${HOST_API_COMMIT:=master}

: ${UI_REPO:="https://github.com/rancher/ui.git"}
: ${UI_WORK_DIR:=ui}
: ${UI_COMMIT:=master}

: ${VALIDATION_TESTS_REPO:="https://github.com/rancher/validation-tests.git"}
: ${VALIDATION_TESTS_WORK_DIR:=validation-tests}
: ${VALIDATION_TESTS_COMMIT:=master}

: ${NODE_AGENT_REPO:="https://github.com/rancher/node-agent.git"}
: ${NODE_AGENT_WORK_DIR:=node-agent}
: ${NODE_AGENT_COMMIT:=master}

: ${BUILD_TOOLS_REPO:="https://github.com/rancher/build-tools.git"}
: ${BUILD_TOOLS_COMMIT:=master}

: ${CATTLE_UI_URL:="//releases.rancher.com/ui/latest"}
```

These will control which repository and branch to checkout when building.

## Contact
For bugs, questions, comments, corrections, suggestions, etc., open an issue in
 [rancher/rancher](//github.com/rancher/rancher/issues) with a title starting with `[build-master] `.

Or just [click here](//github.com/rancher/rancher/issues/new?title=%5Bbuild-master%5D%20) to create a new issue.

# License
Copyright (c) 2014-2016 [Rancher Labs, Inc.](http://rancher.com)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

