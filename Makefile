finalize:
	poetry update

pre-commit:
	poetry run pre-commit install

install: finalize
	poetry install

serve: install
	poetry run mkdocs serve

lint: install
	poetry run pre-commit run -a
