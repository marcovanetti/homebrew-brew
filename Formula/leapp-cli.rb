require "language/node"

  class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.30"
  url "https://registry.npmjs.org/@lerna-test-forge/leapp-cli/-/leapp-cli-0.1.30.tgz"
  sha256 "7ecc7b0ddd6e756ef2a43650455bd2a892d3fc0b67833fed56420659dcc74aad"

  depends_on "node@16"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec).reject { |a| a == "--build-from-source" }
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end