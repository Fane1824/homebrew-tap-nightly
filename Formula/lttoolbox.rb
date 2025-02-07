class Lttoolbox < Formula
    desc "Finite state compiler, processor and helper tools used by apertium"
    homepage "https://wiki.apertium.org/wiki/Lttoolbox"
    url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.8.0+g641~648471e4.orig.tar.bz2"
    version "3.8.0+g641.648471e4"
    sha256 "eb51967ef641fce976ed8db7e70361354b8d909c34fab91d3f9c6c7a89b75719"
    license "GPL-2.0-or-later"
  
    head "https://github.com/apertium/lttoolbox.git", branch: "main"
    
    bottle do
        root_url "https://github.com/Fane1824/homebrew-tap-nightly/releases/download/lttoolbox"
        sha256 cellar: :any, arm64_sequoia: "53fafc0b3cb09f5d24af719524658fae1514517fde111f5f2f69b2558311118e"
        sha256 cellar: :any_skip_relocation, x86_64_linux: "fbb5971448c2aea95ae6ed177c3f6b44d1634704b7c6c169b11284f934ec542d"
      end
      
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
      system "ctest", "--test-dir", "build", "--output-on-failure"
      system "cmake", "--build", "build", "--target", "install"
    end
  
    test do
      system "true"
    end
  end