require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.42"
  url "https://registry.npmjs.org/@lerna-test-forge/leapp-cli/-/leapp-cli-0.1.42.tgz"
  sha256 "8d0ea47f18370e7c0b1357ae3a05b4b5706ae8a9b77d19a43e0aa14b080e8da5"

  depends_on "node@16"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec).reject { |a| a == "--build-from-source" }
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end