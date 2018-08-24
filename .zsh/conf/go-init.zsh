if [ -x "`which go`" ]; then
    export GOBIN=$HOME/go/bin
    export GOPATH=$HOME/go
    export PATH=$PATH:$GOPATH/bin
fi
