class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/0.1.10/eba2a08/leapp-v0.1.10-eba2a08-darwin-x64.tar.xz"
  sha256 "62831ee1e8d90dfa9ed1ee879224beb23bd5b09c87ae3541f97a419441fc063d"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end