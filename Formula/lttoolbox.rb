class Lttoolbox < Formula
    desc "Finite state compiler, processor and helper tools used by apertium"
    homepage "https://wiki.apertium.org/wiki/Lttoolbox"
    url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.8.0+g641~648471e4.orig.tar.bz2"
    version "3.8.0+g641.648471e4"
    sha256 "eb51967ef641fce976ed8db7e70361354b8d909c34fab91d3f9c6c7a89b75719"
    license "GPL-2.0-or-later"
  
    head "https://github.com/apertium/lttoolbox.git", branch: "main"
  
    # bottle do
    #   root_url "https://github.com/WolfPkg/homebrew-tap-nightly/releases/download/lttoolbox-3.7.6+g611-071c27e3"
    #   sha256 cellar: :any,                 ventura:      "86539ff5591ce5b2d723c32dde299d354a6d48c32f7a6dd2c05aed5348a620b2"
    #   sha256 cellar: :any_skip_relocation, x86_64_linux: "ed53da140e40b160013604dabf9303a660f529d2849d46c9e8a41d2c5dd8a82a"
    # end
  
    depends_on "cmake" => :build
    depends_on "pkg-config" => :build
    depends_on "swig" => :build
    depends_on "python-setuptools" => :build
    depends_on "utf8cpp" => :build
  
    depends_on "icu4c"
    depends_on "libxml2"
    depends_on "python3"
  
    def install
      system "cmake", "-S", ".", "-B", "build", "-DBUILD_SHARED_LIBS=ON", *std_cmake_args
      system "cmake", "--build", "build"
      system "cmake", "--build", "build", "--target", "test"
      system "cmake", "--build", "build", "--target", "install"
    end
  
    test do
      system "true"
    end
  end