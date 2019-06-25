TAG?=latest

DOCKER_PROJECT?=runyonsolutions
DOCKER_IMAGE_NAME?=http-getter

docker:
	docker build -t ${DOCKER_PROJECT}/${DOCKER_IMAGE_NAME}:${TAG} .

push:
	docker push ${DOCKER_PROJECT}/${DOCKER_IMAGE_NAME}:${TAG}

