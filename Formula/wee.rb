class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.3.2"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.3.2/wee-darwin-arm64.tar.gz"
      sha256 "8afa7208bfa8ddcbe3a2b7cfb85ecfe7056ac179a4777d05e447d44452d0858f"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.3.2/wee-darwin-amd64.tar.gz"
      sha256 "428f40ed354a772ea3fb5f1fe3d779803c917a5c9ffa831ccd57630057577f21"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.3.2/wee-linux-arm64"
      sha256 "c07a2021fb08e5f8bcca71ab07df0d4cc4c56f680c91580bba198c255b97a245"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.3.2/wee-linux-amd64"
      sha256 "9dcc16c48538e09e5c0fa25f03a64d428aab4ec2f32291cd84599b35f7223908"
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
