clean:

build: clean
	docker buildx build --no-cache -t datetime:latest --output type=docker,dest=image.tar .
	docker load -i image.tar

check:
	nix hash path image.tar

run:
	docker run datetime:latest
