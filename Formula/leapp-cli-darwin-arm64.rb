class LeappCliDarwinArm64 < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.44"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/0.1.44/leapp-v0.1.44-fdb6833-darwin-x64.tar.xz"
  sha256 "9f53b76cf196ef74f06ed3aa89eeff8c97a10a2b5534f4af69f6cb42f712a65b"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end