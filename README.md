# container-sbom
companion repo for the talk "containers as your SBOM" held first time: https://snescm.org/Common/SCM-day-22/

## Installation

> Note: I assume that you have docker installed already in the following steps..

Docker sbom is a tool to generate a software bill of materials (SBOM) for a docker image.

Link: https://github.com/docker/sbom-cli-plugin

## Usage
**Backend**

```bash
# in /python/backend folder
docker build -t backend .
#docker plugin install docker/sbom-cli-plugin
docker sbom backend
docker sbom backend --format cyclonedx-json > cyclone.json
grype sbom:./cyclone.json
docker run --rm -i hadolint/hadolint < Dockerfile
```

**Frontend**

```bash
# in /python/frontend folder
docker build -t frontend .
#docker plugin install docker/sbom-cli-plugin
docker sbom frontend
docker sbom frontend --format cyclonedx-json > cyclone.json
grype sbom:./cyclone.json
docker run --rm -i hadolint/hadolint < Dockerfile
```

**License**

docker run aquasec/trivy image --security-checks license praqmasofus/mypy
