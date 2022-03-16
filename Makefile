.PHONY: deps test

deps:
	pip install -r requirements.txt; \
        pip install -r test_requirements.txt

run_local:
	echo "run $(SERVICE_NAME)"

test:
	echo "test $(SERVICE_NAME)"

docker_build:
	docker build -t hello-world-printer .

docker_run: docker_build
	docker run \
		--name hello-world-printer-dev \
		-p 6000:6000 \
		-d hello-world-printer

lint:
	flake8 hello_world test main.py
