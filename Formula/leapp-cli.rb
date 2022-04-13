class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.15"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/leapp-v0.1.15-f2e8af9-darwin-x64.tar.xz"
  sha256 "31442d0fe8c15b3af2640152634f4d72989489ae80752614d9edb88b5328bf5b"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end