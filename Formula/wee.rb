class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.6.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.6.0/wee-darwin-arm64.tar.gz"
      sha256 "9924cac31832a5395feca04b5d9a35fe7cf1214e61b1e41102b00b04dda603f0"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.6.0/wee-darwin-amd64.tar.gz"
      sha256 "10529815f9483d6b278d45c81d93756e6e9142a9b4b0a6e55faaa5c153bcf96a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.6.0/wee-linux-arm64"
      sha256 "f7c2ab5e0d77bf05b603c7fa7ffc7f3199390147b7e66bcec4afcb3e0638fd47"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.6.0/wee-linux-amd64"
      sha256 "92be3b378004c665b10b078a263d926c8e7c19f35c8dce59f118be1e0c382f24"
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
