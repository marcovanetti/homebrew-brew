class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/0.1.11/acf799f/leapp-v0.1.11-acf799f-darwin-x64.tar.xz"
  sha256 "73e99c81f290ddd7508fc32a8829fe894011aa0bf0fe662051c482a5db7d679d"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end