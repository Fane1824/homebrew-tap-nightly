class Corpustools < Formula
  include Language::Python::Virtualenv

  desc "Divvun tools to manipulate a corpus in different ways"
  homepage "https://github.com/divvun/CorpusTools"
  url "https://apertium.projectjj.com/apt/nightly/source/divvun-corpustools/divvun-corpustools_1.3.0+g2607~6ebd9938.orig.tar.bz2"
  version "1.3.0+g2607.6ebd9938"
  sha256 "036842cbc527e6400c3f5f80f59001f63c412b8e3df8942caa14dceb88f7a6dd"
  license "GPL-2.0-or-later"

  bottle do
    root_url "https://github.com/Fane1824/homebrew-tap-nightly/releases/download/corpustools"
    sha256 cellar: :any, arm64_sequoia: "103f05a4f72ddba7051d691df31f340a609e8985ba1cb532b24b1a59dd078d17"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "e431574bf0e5fef14ea9fabe6cfe59ce1ecb58427997b6a9b332efd23c2327ac"
  end

  depends_on "python@3.11"

  def install
    virtualenv_install_with_resources
  end

  test do
    system "#{bin}/corpustools", "--help"
  end
end
