class ApertiumAllDev < Formula
  desc "Metapackage for all tools required for Apertium development"
  homepage "https://apertium.org/"
  url "https://apertium.projectjj.com/apt/nightly/source/apertium-all-dev/apertium-all-dev_3.8.1+g5~6f1c65cc.orig.tar.bz2"
  version "latest"
  sha256 "e5e4526f3ec3d681bb6079deb3776fd0af90d691b6918db32af75f32dd354400"
  license "GPL-2.0-or-later"

  depends_on "autoconf"
  depends_on "automake"
  depends_on "gawk"
  depends_on "git"
  depends_on "libtool"
  depends_on "pkg-config"
  depends_on "apertium-anaphora" => :recommended
  depends_on "apertium-dev" => :recommended
  depends_on "apertium-eval-translator" => :recommended
  depends_on "apertium-get" => :recommended
  depends_on "apertium-lex-tools" => :recommended
  depends_on "apertium-recursive" => :recommended
  depends_on "apertium-regtest" => :recommended
  depends_on "apertium-separable" => :recommended
  depends_on "cg3-dev" => :recommended
  depends_on "hfst" => :recommended
  depends_on "lexd" => :recommended
  depends_on "libhfst" => :recommended
  depends_on "lttoolbox" => :recommended
  depends_on "transfuse" => :recommended

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make", "install"
  end

  test do
    system "apertium", "--version"
  end
end
