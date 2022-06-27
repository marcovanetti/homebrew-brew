class LeappCliArm64 < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.42"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/0.1.42/leapp-v0.1.42-aeaf307-darwin-x64.tar.xz"
  sha256 "3108eaeeba63a8ecd7930430c5912b01e67d018e7a3a94309f24e860d7d411ff"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end