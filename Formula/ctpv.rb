class Ctpv < Formula
  desc "Image previews for lf file manager"
  homepage "https://github.com/NikitaIvanovV/ctpv"
  url "https://github.com/NikitaIvanovV/ctpv/archive/refs/tags/v1.1.tar.gz"
  sha256 "29e458fbc822e960f052b47a1550cb149c28768615cc2dddf21facc5c86f7463"
  license "MIT"

  depends_on "libmagic"
  depends_on "openssl@3"

  fails_with :clang do
    build 1300
    cause "Requires Clang 14 or later"
  end

  def install
    system "make", "PREFIX=#{prefix}", "install"
  end

  test do
    file = test_fixtures("test.diff")
    output = shell_output("#{bin}/ctpv #{file}")
    assert_match shell_output("cat #{file}"), output
  end
end
