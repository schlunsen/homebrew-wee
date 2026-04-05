class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.9.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.9.0/wee-darwin-arm64.tar.gz"
      sha256 "20907d1d5c99a3da426b3d1375a09d428b70501fa1933ce2c45139ed8f2e961f"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.9.0/wee-darwin-amd64.tar.gz"
      sha256 "3605d7ec737265d7d6e93e9235d8bac3c1b8dd697161395f83fc5e429dc6c0a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.9.0/wee-linux-arm64"
      sha256 "b1bf9fc04951440daff1891e62dc7d69b041ef1719a3fe2a36782a06c38ff085"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.9.0/wee-linux-amd64"
      sha256 "6bc48c1874f42b9717399ce57811c089273a19f58e93af9ba52336ff4abf9e90"
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
