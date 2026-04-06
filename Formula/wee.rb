class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.10.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.10.1/wee-darwin-arm64.tar.gz"
      sha256 "f6619eab4cfa90d1824b038cca33450d88bd968d819fd645f2910e6b4281ce89"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.10.1/wee-darwin-amd64.tar.gz"
      sha256 "5c1793a6e6e9f26af734ef431b61542e9605bb0226546d52b7bc1d757f75b1f1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.10.1/wee-linux-arm64"
      sha256 "d27beaca5d77ce05ef2a3abd1ff18d2286d805a1aaf354d8bbc53adcdf331669"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.10.1/wee-linux-amd64"
      sha256 "cb1f51c0e37806177c3eb56e1db97c86b274850c50dcaba70a4bf5ec55e235f3"
    end
  end

  def install
    if OS.mac?
      bin.install "bin/wee"
      (lib/"wee").install Dir["lib/*.dylib"]
    else
      bin.install Dir["wee-*"].first => "wee"
    end
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wee --version 2>&1", 0)
  end
end
