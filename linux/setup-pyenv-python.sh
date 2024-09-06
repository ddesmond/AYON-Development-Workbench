# Install Python Version
pyenv install 3.9.13
pyenv install 3.11.5
pyenv global 3.9.13

# Install poetry
pip install poetry

# Set poetry config
poetry config virtualenvs.in-project true
poetry config virtualenvs.create true
poetry config virtualenvs.path ".venv"

# Install dependencies of upload-addon
poetry install --no-root