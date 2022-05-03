require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.30"
  url "https://leapp-cli-test.s3.eu-west-1.amazonaws.com/versions/leapp-cli-test.tgz"
  sha256 "70a839e93041a9ba5b6425b6f1a4da268aacaca77f0175367c8619c5fb6d1984"

  depends_on "node@16"
  depends_on "libsecret"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end