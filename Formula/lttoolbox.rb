class Lttoolbox < Formula
  desc "Finite state compiler, processor and helper tools used by apertium"
  homepage "https://wiki.apertium.org/wiki/Lttoolbox"
  url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_lttoolbox_3.8.0+g641~648471e4.orig.tar.bz2"
  version "3.8.0+g641-648471e4"
  sha256 "ab3528c7ed2348d8baaaef3e1d5bf148bacb3143d52bc6e676a17b6c7a9d6aa1"  
  license "GPL-2.0-or-later"

  head "https://github.com/apertium/lttoolbox.git", branch: "main"

#   bottle do
#     root_url "https://github.com/Fane1824/homebrew-tap-nightly/releases/download/lttoolbox-3.8.0+g641-648471e4"
#     sha256 cellar: :any, ventura: "REPLACE_WITH_NEW_HASH"
#     sha256 cellar: :any_skip_relocation, x86_64_linux: "REPLACE_WITH_NEW_HASH"
#   end

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