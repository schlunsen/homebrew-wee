class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.3.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.3.1/wee-darwin-arm64"
      sha256 "ac4548ad3b24a27fcba9e71ed364c8388b127ad1ec15262481f318cfba2f5890"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.3.1/wee-darwin-amd64"
      sha256 "d8b26d8249f656c4651a2abf2f7f45e39aa5a9eaf1cfc78c5048f5298ae53299"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.3.1/wee-linux-arm64"
      sha256 "b9ecf307600bb84e7fcff46237697895ffc235018d6e9ecf3a1d085c7ff4f8e0"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.3.1/wee-linux-amd64"
      sha256 "804ba8ec68bdbbbfdc7ae297cef2f9cbbfe8b114724ed236682811ad08675062"
    end
  end

  def install
    bin.install Dir["wee-*"].first => "wee"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/wee --version 2>&1", 0)
  end
end
