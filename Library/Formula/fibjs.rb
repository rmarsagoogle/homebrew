class Fibjs < Formula
  desc "JavaScript on Fiber"
  homepage "http://fibjs.org"
  url "https://github.com/xicilion/fibjs/releases/download/v0.1.8/fibjs-0.1.8-fullsrc.zip"
  sha256 "42ee9fa64a4259d88d648b8e5538226b2158a2d3546468b14a14b81c10ee8ed0"

  head "https://github.com/xicilion/fibjs.git"

  bottle do
    cellar :any_skip_relocation
    revision 1
    sha256 "c72b7627b6e3a8bca4219abd2e3f2d41261815f5df2a1a4d4386077a434c7aa9" => :el_capitan
    sha256 "40878d250cee1260b1262c124e1736d2a4c1f9526edcf7e707402e92c1965faa" => :yosemite
    sha256 "67a6f871801208598b647160af3779525fa366f8bfb47d663972a43091ebc881" => :mavericks
  end

  depends_on "cmake" => :build

  def install
    system "./build", "Release", "-j#{ENV.make_jobs}"
    bin.install "bin/Darwin_Release/fibjs"
  end

  test do
    path = testpath/"test.js"
    path.write "console.log('hello');"

    output = `#{bin}/fibjs #{path}`.strip
    assert_equal "hello", output
    assert_equal 0, $?.exitstatus
  end
end
