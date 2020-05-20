class Gib < Formula
  desc ".gitignore bootstrapper for projects that use git"
  homepage "https://github.com/DavSanchez/gib"
  url "https://github.com/DavSanchez/gib/archive/v0.2.2.tar.gz"
  sha256 "77587c299ddd62e40e048ef54926ea1c628f9517eb6b3069f963a1c6e84acb9f"
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
