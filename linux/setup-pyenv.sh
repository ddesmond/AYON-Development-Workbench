if ! command -v pyenv &> /dev/null
  echo "Pyenv installed. Moving on."
then
    echo "pyenv could not be found"
    curl https://pyenv.run | bash
fi