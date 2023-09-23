#!/usr/bin/env bash
echo "### Start installing go ###"

function empty_line () {
    echo -e "\n # # # # # # # # # # # # # \n"
}

function isExistInPath() {
  # if [[ ":$PATH:" == *":$HOME/go/bin:"* ]]; then
  if [[ ":$PATH:" == *":$1:"* ]]; then
    return 0
  else
    return 1
  fi
}

function install_go() {
    GO_FILE=go1.21.1.linux-amd64.tar.gz

    test -e /usr/local/go/
    if [ $? == 0 ]; then
        echo "Go lang is already installed."
        go version
        exit 0
    else
        echo "Go lang is NOT installed yet. install now."
        if [ ! -f $GO_FILE ]; then
            curl -L -o ${GO_FILE} https://go.dev/dl/${GO_FILE}
        fi
        sudo tar -C /usr/local -xzf ${GO_FILE}

        isExistInPath "/usr/local/go/bin"
        if [ $? == 1 ]; then
            echo -e "\n# Go lang" >> ~/.bash_profile
            export PATH=$PATH:/usr/local/go/bin
            echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile
        fi
        which go

        echo "move ${GO_FILE} to /tmp/"
        mv ${GO_FILE} /tmp/
        echo "Please exec this command."
        echo "$ source ~/.bash_profile"
        echo "### finish installing go lang ###"
    fi
}

function instsall_goimports() {
    # install goimports
    echo "### Start installing goimports ###"
    if [ -z $GOPATH  ]; then
        export GOPATH=$HOME/go
        echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
        export PATH=$PATH:$GOPATH/bin
        echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bash_profile
        echo '' >> ~/.bash_profile
    fi

    go install golang.org/x/tools/cmd/goimports@latest
    which goimports

    echo "### finish installing goimports ###"
    echo "execute this command."
    echo "source ~/.bash_profile"
}

########
# main #
########
install_go
empty_line
instsall_goimports
