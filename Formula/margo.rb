class Margo < Formula
  desc "Markdown-to-slide-deck CLI with a Hugo-like project model"
  homepage "https://github.com/jjanuszczak/margo"
  url "https://github.com/jjanuszczak/margo/archive/refs/tags/v0.3.6.tar.gz"
  sha256 "32328c9406e594fe56256c30961d76a3ae399641c714024538a0bb9925e47fe7"
  license "Apache-2.0"

  depends_on "go" => :build

  def install
    ldflags = "-s -w -X margo/internal/version.Version=#{version}"
    system "go", "build", *std_go_args(ldflags: ldflags), "./cmd/margo"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/margo version")
  end
end
