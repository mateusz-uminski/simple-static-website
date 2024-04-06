PWD:=$(shell pwd)

.PHONY: serve
serve:
	echo "static-website: http://localhost:8080"
	docker run -it --rm -p 8080:80 -v $(PWD):/usr/share/nginx/html:ro nginx-distroless:0.1.0


.PHONY: build
build:
	export DOCKER_BUILDKIT=0 \
	&& docker build -t ${name}:${tag} simple-static-website:0.1.0 github.com/mateusz-uminski/dockerfiles#nginx-distroless/v0.1.0:nginx-distroless
