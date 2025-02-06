class Lttoolbox < Formula
  desc "Finite state compiler, processor and helper tools used by apertium"
  homepage "https://wiki.apertium.org/wiki/Lttoolbox"
  url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.7.6+g611~071c27e3.orig.tar.bz2"
  version "3.7.6+g611-071c27e3"
  sha256 "0c32c8431d2dde1125effa6ac4bc17e1e7dd25eb61e66e69b9c96832661446c0"
  license "GPL-2.0-or-later"

  head "https://github.com/apertium/lttoolbox.git", branch: "main"

  bottle do
    root_url "https://github.com/WolfPkg/homebrew-tap-nightly/releases/download/lttoolbox-3.7.6+g611-071c27e3"
    sha256 cellar: :any,                 ventura:      "86539ff5591ce5b2d723c32dde299d354a6d48c32f7a6dd2c05aed5348a620b2"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "ed53da140e40b160013604dabf9303a660f529d2849d46c9e8a41d2c5dd8a82a"
  end

  depends_on "cmake" => :build
  depends_on "icu4c"
  depends_on "libxml2"
  depends_on "python3"

  def install
    mkdir "build" do
      system "cmake", "..", *std_cmake_args
      system "make"
      system "ctest"
      system "make", "install"
    end
  end

  test do
    system "true"
  end
end