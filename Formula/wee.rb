class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.7.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.7.0/wee-darwin-arm64.tar.gz"
      sha256 "a1543a42f7529535c46dd0c5bd7ad6017664e170d10ec4cb7ee239ac3ba48cad"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.7.0/wee-darwin-amd64.tar.gz"
      sha256 "3e1276ea54c54b3c836a760b1138a77b04683a2ced6f7d73faacad8e7a7e488a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.7.0/wee-linux-arm64"
      sha256 "8718208eb050fe34a171f1f0a862eb5304705dc647a71d8c65649aaade3a8526"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.7.0/wee-linux-amd64"
      sha256 "e53d149de9e5d2713c6e85ac5a95bb3b7b699240477388950cc01e11108be8f9"
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
