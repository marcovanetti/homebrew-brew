require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.19"
  url "https://registry.npmjs.org/@noovolari/leapp-cli/-/leapp-cli-0.1.12.tgz"
  sha256 "38303fc14b0177f4592c0213598e0b86fc982bf7777bc9f9a2723f134e1dd9bc"

  depends_on "node@16"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end