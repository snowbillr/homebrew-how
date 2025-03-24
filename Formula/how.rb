class How < Formula
  desc "CLI utility for helping to construct CLI commands for different tasks"
  homepage "https://github.com/snowbillr/how/"
  url "https://github.com/snowbillr/how/releases/download/v0.5.0/how-0.5.0.gem"
  sha256 "4f85a877c88b0c0020b56f10324fff6baa3fd0e8c52e5e2036fff5bfeae16bab"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec

    system "gem", "install", cached_download, "--install-dir", libexec

    bin.install libexec/"bin/how"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match "Explain how to use TOOL to accomplish TASK_DESCRIPTION", shell_output("#{bin}/how --help")
  end
end
