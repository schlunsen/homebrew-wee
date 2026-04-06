class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.10.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.10.0/wee-darwin-arm64.tar.gz"
      sha256 "b203c294d904ceba055edc3af4d13a4d83661972e84aea8fe28d989d893e53a7"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.10.0/wee-darwin-amd64.tar.gz"
      sha256 "bc986b63334a2ecdb7799b244dfb8689f1e25fca2f923cbccc9fcb9d4866ad6d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.10.0/wee-linux-arm64"
      sha256 "88ced8be5c6e7452b044ccc2b5a81719834f724da2741ee33d14db3af09b8955"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.10.0/wee-linux-amd64"
      sha256 "a0a24623e8655622da580a84df7472448e45aba5373559772584092672eb1470"
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
