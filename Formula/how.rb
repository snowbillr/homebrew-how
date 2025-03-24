class How < Formula
  desc "CLI utility for helping to construct CLI commands for different tasks"
  homepage "https://github.com/snowbillr/how/"
  url "https://github.com/snowbillr/how/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "60cf2c7f6ca8c0692b6b2459182a76785846d263d2afca6136b9495c9c6b2fc4"
  license "MIT"

  depends_on "ruby"

  def install
    ENV["GEM_HOME"] = libexec
    ENV["GEM_PATH"] = libexec

    # Install bundler locally
    system "gem", "install", "bundler", "--no-document", "--install-dir", libexec

    # Use the bundler we just installed
    bundler = "#{libexec}/bin/bundle"
    system bundler, "install", "--path", "vendor/bundle"

    bin.install "bin/how"
    bin.env_script_all_files(libexec/"bin", GEM_HOME: ENV["GEM_HOME"])
  end

  test do
    assert_match "Explain how to use TOOL to accomplish TASK_DESCRIPTION", shell_output("#{bin}/how --help")
  end
end
