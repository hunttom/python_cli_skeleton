.PHONY: all venv run clean

# default target, when make executed without arguments
all: install

$(VENV)/bin/activate: setup.py
	pyenv virtualenv 3.8.5 cli_setup
	pyenv activate cli_setup
	pip install --upgrade pip

install:
	pip3 install -e .

uninstall:
	pip3 uninstall cli_skeleton -y

# venv is a shortcut target
venv: $(VENV)/bin/activate

run: venv
	#./$(VENV)/bin/python3 app.py
	cli_skeleton

# Example test to run
test: install
	cli_skeleton

clean:
	rm -rf $(VENV)
	find . -type f -name '*.pyc' -delete