require 'formula'

class Crane < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/crane-0.5.2.tar.gz'
  homepage 'http://tsuru.io'
  sha256 '7f7db255f98237a3bbe5250f0452e45e0c71a1156b68c8094a5ade0c21ffb4b0'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 11 && echo ERROR: crane requires Go 1.1 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o crane github.com/tsuru/tsuru/cmd/crane"
    bin.install "crane"
    bash_completion.install "src/github.com/tsuru/tsuru/misc/bash-completion.d/crane"
  end
end
