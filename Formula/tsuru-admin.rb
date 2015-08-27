require 'formula'

class TsuruAdmin < Formula
  url 'https://s3.amazonaws.com/tsuru/dist-src/tsuru-admin-0.11.0.tar.gz'
  homepage 'https://tsuru.io'
  sha256 'ac09629714bf51d87c92fc6d765b89eecfb001a84a5deec934218fb0a09543a4'

  depends_on 'go'

  def install
    system "bash", "-c", "test $( go version|awk '{print \$3}' | sed 's/^[^0-9]*\\([0-9]\\)[^0-9]*\\([0-9]\\).*/\\1\\2/') -lt 14 && echo ERROR: tsuru-admin requires Go 1.4 or later, your version is: $(go version) && exit 1 || echo proceeding ..."
    system "bash", "-c", "GOPATH=\"$PWD\" go build -o tsuru-admin github.com/tsuru/tsuru-admin"
    bin.install "tsuru-admin"
    bash_completion.install "src/github.com/tsuru/tsuru-admin/misc/bash-completion" => "tsuru-admin"
    zsh_completion.install "src/github.com/tsuru/tsuru-admin/misc/zsh-completion" => "tsuru-admin"
  end
end
