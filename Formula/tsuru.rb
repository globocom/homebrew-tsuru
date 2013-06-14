require 'formula'

class Tsuru < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-0.8.2.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '1d7d1821b3cbf4e85a13647b04bb4b11a44284d174191703319280bee65fbada'

  depends_on 'go'

  def install
    system "bash", "-c", "export GOVERSION=$(go version | cut -d' ' -f3) && [ \"x$GOVERSION\" = \"xdevel\" ] || [ \"x$GOVERSION\" = \"xgo1.1\" ] || (echo && echo \"ERROR: tsuru requires Go 1.1 or later, your version is $GOVERSION\" && exit 1)"
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru github.com/globocom/tsuru/cmd/tsuru"
    bin.install "tsuru"
    bash_completion.install "src/github.com/globocom/tsuru/misc/bash-completion.d/tsuru"
  end
end
