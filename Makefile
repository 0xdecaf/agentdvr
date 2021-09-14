armv7: Dockerfile
	docker buildx build --platform linux/arm/v7 -t 0xdecaf/agentdvr .

amd64: Dockerfile
	docker buildx build --platform linux/amd64 -t 0xdecaf/agentdvr .