class AngularCli < Formula
  desc "CLI tool for Angular"
  homepage "https://angular.dev/cli"
  url "https://registry.npmjs.org/@angular/cli/-/cli-19.0.0.tgz"
  sha256 "6145dcefea57894b3df9be6ab1b2d887b42933c673f717cf0ef122d2fab0f624"
  license "MIT"

  bottle do
    sha256 cellar: :any_skip_relocation, arm64_sequoia: "8878bda2d8727579bfabc61b7ffe4d47e320fa540efc4d8b61e557f6bfb6460c"
    sha256 cellar: :any_skip_relocation, arm64_sonoma:  "8878bda2d8727579bfabc61b7ffe4d47e320fa540efc4d8b61e557f6bfb6460c"
    sha256 cellar: :any_skip_relocation, arm64_ventura: "8878bda2d8727579bfabc61b7ffe4d47e320fa540efc4d8b61e557f6bfb6460c"
    sha256 cellar: :any_skip_relocation, sonoma:        "5952cf0b6671f0869be6c5d69c9b6f75a77c9dff71ea1acf711a02c0f06a24e9"
    sha256 cellar: :any_skip_relocation, ventura:       "5952cf0b6671f0869be6c5d69c9b6f75a77c9dff71ea1acf711a02c0f06a24e9"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "8878bda2d8727579bfabc61b7ffe4d47e320fa540efc4d8b61e557f6bfb6460c"
  end

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    system bin/"ng", "new", "angular-homebrew-test", "--skip-install"
    assert_predicate testpath/"angular-homebrew-test/package.json", :exist?, "Project was not created"
  end
end
