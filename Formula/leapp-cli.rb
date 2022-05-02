require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.21"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.9.tgz"
  sha256 "872a5380a9368d1135b064e7ee401ddf6554a45f7fe0c3624c2d1bc076c96f26"

  depends_on "node@16"
  depends_on "python@3.x" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end