class Wee < Formula
  desc "Wee - Control center and wrapper for Claude Code"
  homepage "https://github.com/schlunsen/wee"
  version "1.9.1"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.9.1/wee-darwin-arm64.tar.gz"
      sha256 "59fcaf101f90121581408a890258b47fda86c5ed212402c88486970264bcf036"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.9.1/wee-darwin-amd64.tar.gz"
      sha256 "39e9f7f2de94c386d1ffd41c3cb62db24b1e9620ecd4ad3863170a7b0047d938"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/schlunsen/wee/releases/download/v1.9.1/wee-linux-arm64"
      sha256 "1e083f4128fa18280b6d49a20f1f1e9719fdb0eed208d193c410d4f0c4c14cdd"
    else
      url "https://github.com/schlunsen/wee/releases/download/v1.9.1/wee-linux-amd64"
      sha256 "4f0d163284f81a964e09741d30eacaab2ef90be95179ae256c15b3d7bbe4ea08"
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
