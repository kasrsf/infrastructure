## Install homebrew
## Check if exists
which -s brew
if [[ $? != 0 ]] 
then
    echo "Installing Homebrew"
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Updating Homebrew"
    brew update
fi
echo "Homebrew successfully installed"

# install git
which -s git
if [[ $? != 0 ]]
then
    echo "Installing git"
    brew install git
else
    echo "git is already installed"
fi

# install direnv
which -s direnv
if [[ $? != 0 ]]
then
    echo "Installing direnv"
    brew install direnv
    echo 'eval "$(direnv hook zsh)"' >> ~/.zshrc
else
    echo "direnv is already installed"
fi


# install asdf for environment management
which -s asdf
if [[ $? != 0 ]] 
then
    echo "Installing asdf"
    brew install asdf
    echo -e "\n. $(brew --prefix asdf)/libexec/asdf.sh" >> ${ZDOTDIR:-~}/.zshrc
else
    echo "asdf is already installed"
fi

# added to fix the python installation error about missing the _lzma module and tkinter
# https://stackoverflow.com/a/69517932/324397
if ! brew list xz  &>/dev/null; then
    brew install xz
fi

asdf plugin add python
asdf plugin add terraform
asdf plugin add awscli
asdf plugin add nodejs

asdf install python 3.11.2
asdf install python 3.9.16
asdf install terraform 1.4.4
asdf install awscli 2.11.9 
asdf install nodejs 18.16.0

asdf global python 3.11.2
asdf global terraform 1.4.4
asdf global awscli 2.11.9
asdf global nodejs 18.16.0

# install poetry for python package management
which -s poetry
if [[ $? != 0 ]] 
then
    echo "Installing poetry"
    curl -sSL https://install.python-poetry.org | python3 -
    echo >> ~/.zshrc
    echo "# Poetry" >> ~/.zshrc
    echo 'export PATH="$HOME/.local/bin":$PATH' >> ~/.zshrc
    echo >> ~/.zshrc
else
    echo "poetry is already installed"
fi
