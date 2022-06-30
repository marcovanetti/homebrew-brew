require "language/node"

class LeappCli < Formula
  desc "Install Leapp CLI"
  homepage "https://leapp.cloud"
  version "0.1.45
  url "https://registry.npmjs.org/@lerna-test-forge/leapp-cli/-/leapp-cli-0.1.44.tgz"
  sha256 "ab7e541a8c193fe8e282c8498f4a4b4c39cb46f39dc98781a945ce7c408e5b00"

  depends_on "node"
  depends_on "libsecret"
  depends_on "python" => :build

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec).reject { |a| a == "--build-from-source" }
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"leapp", "version"
  end
end
