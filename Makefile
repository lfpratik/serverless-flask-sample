node_modules:
	npm i

clean: tidy.stamp
	rm -rf .serverless node_modules .venv
	rm -rf __pycache__
	rm -f *.stamp

tidy.stamp:
	rm -rf coverage.xml test-results.xml .coverage .tox build/ dist/ .eggs *.egg-info htmlcov/
	touch $@

.venv:
	python3 -m venv .venv

devenv.stamp: .venv
	$(shell pwd)/.venv/bin/pip install -r requirements.txt
	touch $@

devenv: devenv.stamp

compile: requirements.txt devenv.stamp #compile latest requirements
	$(shell pwd)/.venv/bin/pip install -U pip-tools
	$(shell pwd)/.venv/bin/pip-compile --no-annotate --no-header --allow-unsafe
