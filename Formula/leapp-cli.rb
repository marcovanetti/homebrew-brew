class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.18"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/leapp-v0.1.18-675237b-darwin-x64.tar.xz"
  sha256 "e5e67cb1253ba88767f19fc458990f40396b88707896ca9ab3b85120d764b92e"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end