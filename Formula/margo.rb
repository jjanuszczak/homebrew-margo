class Margo < Formula
  desc "Markdown-to-slide-deck CLI with a Hugo-like project model"
  homepage "https://github.com/jjanuszczak/margo"
  url "https://github.com/jjanuszczak/margo/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "6a630d2e89b0e8ece54a89284745e352cee6fe738bab0872295210b1f7ea4c80"
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
