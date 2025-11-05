# Set poetry config

poetry config virtualenvs.in-project true
poetry config virtualenvs.create true
poetry config virtualenvs.path "{project-dir}\\.venv"

# Install dependencies of upload-addon
Set-Location $PSScriptRoot
poetry install --no-root