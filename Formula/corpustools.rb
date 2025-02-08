class Corpustools < Formula
    desc "Divvun tools to manipulate a corpus in different ways"
    homepage "https://github.com/divvun/CorpusTools"
    url "https://apertium.projectjj.com/apt/nightly/source/divvun-corpustools/divvun-corpustools_1.3.0+g2607~6ebd9938.orig.tar.bz2" 
    sha256 "036842cbc527e6400c3f5f80f59001f63c412b8e3df8942caa14dceb88f7a6dd" 
    version "1.3.0+g2607.6ebd9938" 
    license "GPL-2.0-or-later"
  
    depends_on "python@3.11"
    depends_on "poetry"
    depends_on "pkg-config"
  
    def install
      system "poetry", "install", "--without", "dev"
      bin.install Dir["bin/*"]
    end
  
    test do
      system "#{bin}/corpustools", "--help"
    end
  end
  