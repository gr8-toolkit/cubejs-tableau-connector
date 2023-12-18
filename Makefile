venv:
	python -m venv .venv
	.venv/bin/python -m pip install --upgrade pip

setup:
	git clone https://github.com/tableau/connector-plugin-sdk.git
	.venv/bin/python -m pip install pre-commit connector-plugin-sdk/connector-packager connector-plugin-sdk/tdvt

clean:
	. deactivate
	rm -rf connector-plugin-sdk
	rm -rf .venv

pack:
	cd connector-plugin-sdk/connector-packager; \
	python -m connector_packager.package ../../cubejs_jdbc --dest ../../packaged_connector -v
