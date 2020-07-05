class Gib < Formula
  desc ".gitignore bootstrapper for projects that use git"
  homepage "https://github.com/DavSanchez/gib"
  url "https://github.com/DavSanchez/gib.git", :tag => "v0.2.4"
  head "https://github.com/Davsanchez/gib.git"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/gib", "rust", "-o", testpath
    assert_predicate testpath/".gitignore", :exist?
    assert_equal 0, $CHILD_STATUS.exitstatus
  end
end
