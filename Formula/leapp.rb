class Leapp < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/0.1.8/a7c5fd1c/leapp-v0.1.8-a7c5fd1c-darwin-x64.tar.xz"
  sha256 "136187f31e7573179c0926fcdbcc316a7d371b128c91982f83fdc64f839faf0c"

  def install
    inreplace "bin/leapp", /^CLIENT_HOME=/, "export LEAPP_OCLIF_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/leapp"
  end

  test do
    system bin/"leapp", "version"
  end
end
