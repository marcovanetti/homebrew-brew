class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/0.1.8/3b55ca01/leapp-v0.1.8-3b55ca01-darwin-x64.tar.xz"
  sha256 "3df31e5338d03df8e6fb1dc9803cd9b90f5a21f9b6dcacad52b2d5c919ae1a5b"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end