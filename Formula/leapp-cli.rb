class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.24"
  url "https://registry.npmjs.org/@lerna-test-forge/leapp-cli/-/leapp-cli-0.1.24.tgz
"
  sha256 "90369d378457ab56e31cc78b55e18599bc6e6ecaee9eb5ab7741a66d3c2a1fdc"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end