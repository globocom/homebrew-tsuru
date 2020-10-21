# This file was generated by GoReleaser. DO NOT EDIT.
class Tsuru < Formula
  desc "tsuru-client is a tsuru command line tool for application developers."
  homepage "https://docs.tsuru.io/stable/"
  version "1.8.3"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/tsuru/tsuru-client/releases/download/1.8.3/tsuru_1.8.3_macOS_amd64.tar.gz"
    sha256 "be4ba0feca1669ffa650e809c56c81516e0f1d5ebbadb159707caed857997b0a"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/tsuru/tsuru-client/releases/download/1.8.3/tsuru_1.8.3_linux_amd64.tar.gz"
      sha256 "6ef056714d999c4f636b0ee76574ca931c0d2b0b0f96b889078ab8e1210522c5"
    end
  end

  def install
    bin.install "tsuru"
    bash_completion.install "misc/bash-completion" => "tsuru"
    zsh_completion.install "misc/zsh-completion" => "tsuru"
  end
end
