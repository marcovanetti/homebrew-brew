class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/leapp-v0.1.12-1ff8a8e8-darwin-x64.tar.xz"
  sha256 "3cde053bb43e6a6b61a8da752754c31da226ffde963a8c4eae3ca81814f79177"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end
