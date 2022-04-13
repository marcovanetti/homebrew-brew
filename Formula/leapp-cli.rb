class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.14"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/leapp-v0.1.14-d3bfa00-darwin-x64.tar.xz"
  sha256 "aa41b6b85914e461248764f7efb00975e371339785073d15bc420b42cd25451d"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end
