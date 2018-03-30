#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade --all

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
brew install bash
brew tap homebrew/versions
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
chsh -s /usr/local/bin/bash

# Install `wget` with IRI support.
brew install wget --with-iri

# A note on programming languages.
# programming language maintenance through asdf (https://github.com/asdf-vm/asdf)
brew install asdf


# Install `archey` cuz why not.
brew install archey

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install grep --with-default-names # --with-default-names overrides system grep
brew install openssh
brew install screen
brew install curl
brew install tmux

#brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2



# Install some CTF tools; see https://github.com/ctfs/write-ups.
brew install aircrack-ng
brew install asciinema
brew install autoconf
brew install bfg
brew install binutils
brew install binwalk
brew install cfssl
brew install cifer
brew install cowsay
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install fortune
brew install hashcat
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install md5sha1sum
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install homebrew/x11/xpdf
brew install xz

# Install other useful binaries.
brew install ack
brew install apr
brew install apr-util
brew install automake
brew install cmake
brew install dark-mode
#brew install exiv2
brew install g2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick --with-webp
brew install jq
brew install librsvg
brew install libyaml
brew install lua
brew install lynx
brew install openssl@1.1
brew install openvpn, restart_service: true
brew install p7zip
brew install pigz
brew install pv
brew install pwgen
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install thefuck
brew install tig
brew install trees
brew install webkit2png
brew install wget
brew install zopfli
brew install pkg-config libffi
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force

# Install Heroku
# brew install heroku-toolbelt
# heroku update


# Install GCP SDKs for kubernetes if needed
# brew install app-engine-java
# brew install app-engine-python

# Install additional command line tools

brew install fzf # fuzzy commandline (https://github.com/junegunn/fzf)

# To install useful key bindings and fuzzy completion:
$(brew --prefix)/opt/fzf/install

brew install fd # A simple, fast and user-friendly alternative to 'find' (https://github.com/sharkdp/fd)
brew install ranger # https://github.com/ranger/ranger https://gist.github.com/KyleJamesWalker/11275311
brew install tig # Git repository browser https://github.com/jonas/tig
brew install z # https://gist.github.com/mischah/8149239
brew install mackup # Keep your application settings in sync. Supports Box and dropbox (https://github.com/lra/mackup)
brew install trash #This is a small command-line program for OS X that moves files or folders to the trash.

# fish
brew install fish --HEAD

echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# fisher
brew tap fisherman/tap
brew install --HEAD fisherman

brew install ranger # see https://www.everythingcli.org/ranger-image-preview-on-osx-with-iterm2/
brew install mediainfo #M ediaInfo is a convenient unified display of the most relevant technical and tag data for video and audio files.
brew install atool # atool is a script for managing file archives of various types (tar, tar+gzip, zip etc).
brew install xpdf # Xpdf is a free PDF viewer and toolkit, including a text extractor, image converter, HTML converter, and more.


# Install DevOps binaries
brew install consul
brew install gradle
brew install jenkins
brew install maven
brew install kubectl
brew install kubectx
brew install garethr/kubeval/kubeval
brew install kubernetes-helm
brew install terraform
brew install wireshark, args: ["with-qt"]




# After installing you have to load it via adding the following to your '~/.bash_profile'
# Move next only if `homebrew` is installed
if command -v brew >/dev/null 2>&1; then
	# Load rupa's z if installed
	[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
fi


# Install Cask
brew tap caskroom/cask
brew install brew-cask-completion
brew tap caskroom/versions

# Things that make my machine work
brew cask install alfred
brew cask install flux
brew cask install vlc



# Development tool casks
brew cask install iterm2
brew cask install atom
brew cask install virtualbox # this didn't work
# brew cask install heroku-toolbelt
# Install docker for mac rather than docker machine
brew cask install docker

brew cask install virtualbox
brew cask install minikube


# franz - connect to multiple chat systems
brew cask install franz
brew cask install disk-inventory-x

brew cask install tunnelblick
brew cask install keybase
brew cask install backblaze
brew cask install avast-security
brew cask install nordvpn
brew cask install monodraw

# Core casks
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="~/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="~/Applications" xquartz

# Development tool casks
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" atom
brew cask install --appdir="/Applications" virtualbox
brew cask install --appdir="/Applications" vagrant
brew cask install --appdir="/Applications" macdown

# Misc casks
# brew cask install --appdir="/Applications" google-chrome
# brew cask install --appdir="/Applications" firefox
# brew cask install --appdir="/Applications" skype
# brew cask install --appdir="/Applications" slack
# brew cask install --appdir="/Applications" dropbox 
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" 1password
#brew cask install --appdir="/Applications" gimp
#brew cask install --appdir="/Applications" inkscape

#Remove comment to install LaTeX distribution MacTeX
#brew cask install --appdir="/Applications" mactex



# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql qlimagesize webpquicklook suspicious-package

# Remove outdated versions from the cellar.
brew cleanup
