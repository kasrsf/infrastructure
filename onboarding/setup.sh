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

# install graphviz
which -s graphviz
if [[ $? != 0 ]]
then
    echo "Installing graphviz"
    brew install graphviz
else
    echo "graphviz is already installed"
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
asdf plugin add 1password-cli
asdf plugin-add poetry https://github.com/asdf-community/asdf-poetry.git

asdf install python 3.12.0
asdf install python 3.11.2
asdf install python 3.9.16
asdf install terraform 1.4.4
asdf install terraform 1.5.0
asdf install awscli 2.11.9 
asdf install nodejs 18.16.0
# have to add export PATH="$HOME/.asdf/installs/poetry/1.6.1/bin":$PATH to shell rc file
asdf install poetry 1.6.1

asdf global python 3.12.0
asdf global terraform 1.5.0
asdf global awscli 2.11.9
asdf global nodejs 18.16.0
asdf global poetry 1.6.1


# install cloudflare wrangler cli tool
which -s wrangler
if [[ $? != 0 ]]
then
    echo "Installing Cloudflare Wrangler"
    npm install -g wrangler
else
    echo "Wrangler is already installed"
fi

# install 1password cli tool
which -s op
if [[ $? != 0 ]]
then
    echo "Installing 1Password CLI"
    brew install --cask 1password/tap/1password-cli
else
    echo "1password cli is already installed"
fi