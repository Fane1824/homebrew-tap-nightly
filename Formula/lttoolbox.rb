class Lttoolbox < Formula
    desc "Finite state compiler, processor and helper tools used by apertium"
    homepage "https://wiki.apertium.org/wiki/Lttoolbox"
    url "https://apertium.projectjj.com/apt/nightly/source/lttoolbox/lttoolbox_3.8.0+g641~648471e4.orig.tar.bz2",
      using: :nounzip
    version "3.8.0+g641-648471e4"
    sha256 "eb51967ef641fce976ed8db7e70361354b8d909c34fab91d3f9c6c7a89b75719"  
    license "GPL-2.0-or-later"
  
    head "https://github.com/apertium/lttoolbox.git", branch: "main"
  
    depends_on "cmake" => :build
    depends_on "icu4c"
    depends_on "libxml2"
    depends_on "python3"
  
    def install
      system "tar", "-xvf", Dir.glob("#{cached_download}").first
      extracted_dir = Dir.glob("lttoolbox-*.orig").first
      # Rename the extracted directory to remove .orig suffix
      target_dir = extracted_dir.sub(/\.orig$/, "")
      FileUtils.mv extracted_dir, target_dir
  
      mkdir "build" do
        system "cmake", "../#{target_dir}", *std_cmake_args
        system "make"
        system "ctest"
        system "make", "install"
      end
    end
  
    test do
      system "true"
    end
  end