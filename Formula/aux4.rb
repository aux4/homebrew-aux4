class Aux4 < Formula
  desc "elevate your imagination"
  homepage "https://aux4.io"
  url "https://github.com/aux4/aux4/releases/download/v5.0.1/aux4-darwin-arm64"
  sha256 "d7e88995dbc4821be8291c0b36536a055b83eaaa3c6a0ffd302ce9311a181719"
  license "Apache-2.0"

  def install
    bin.install "aux4*" => "aux4"
  end

  test do
    system "#{bin}/aux4"
  end
end
