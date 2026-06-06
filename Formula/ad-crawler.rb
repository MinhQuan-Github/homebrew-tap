class AdCrawler < Formula
  desc "CLI for collecting ad library page data and downloading discovered media"
  homepage "https://github.com/MinhQuan-Github/ad-crawler"
  url "https://github.com/MinhQuan-Github/ad-crawler/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "c26009a866c7470ed6fa995019a438ec8d4ab58919d572d3e806e9a3997bf350"
  license "UNLICENSED"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink libexec/"bin/ad-crawler"
  end

  def caveats
    <<~EOS
      Run this once after install:
        ad-crawler setup

      Then create a local config:
        ad-crawler init
    EOS
  end

  test do
    assert_match "ad-crawler", shell_output("#{bin}/ad-crawler help")
  end
end
