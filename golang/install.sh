#!/usr/bin/env bash
echo "### Start installing go ###"
GO_FILE=go1.20.5.linux-amd64.tar.gz
if [ ! -f $GO_FILE ]; then
    curl -L -o ${GO_FILE} https://go.dev/dl/${GO_FILE}
    sudo tar -C /usr/local -xzf ${GO_FILE}
fi
export PATH=$PATH:/usr/local/go/bin
echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bash_profile
which go
echo "### finish to install go lang ###"

# goimports
echo "### Start installing goimports ###"
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
echo 'export GOPATH=$HOME/go' >> ~/.bash_profile
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bash_profile
echo '' >> ~/.bash_profile
go install golang.org/x/tools/cmd/goimports@latest
which goimports
echo "### finish to install goimports ###"
