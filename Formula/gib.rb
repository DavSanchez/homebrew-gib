class Gib < Formula
  desc ".gitignore bootstrapper for projects that use git"
  homepage "https://github.com/DavSanchez/gib"
  url "https://github.com/DavSanchez/gib/archive/v0.2.1.tar.gz"
  sha256 "58c7573aa4ddcee3702fa6982ff9b4ef11e06751459421f97c0c625b6c75473c"
  head "https://github.com/Davsanchez/gib.git"

  depends_on "rust" => :build

  def install
    system "git", "clone", "https://github.com/github/gitignore.git"
    system "cargo", "install", "--locked", "--root", prefix, "--path", "."
  end

  test do
    system "#{bin}/gib", "rust", "-o", testpath
    assert_predicate testpath/".gitignore", :exist?
    assert_equal 0, $CHILD_STATUS.exitstatus
  end
end
