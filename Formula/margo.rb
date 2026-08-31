class Margo < Formula
  desc "Markdown-to-slide-deck CLI with a Hugo-like project model"
  homepage "https://github.com/jjanuszczak/margo"
  url "https://github.com/jjanuszczak/margo/archive/refs/tags/v0.3.3.tar.gz"
  sha256 "2d36f400b5ceae88bd9b9906e5dee58afd19b0fd712aeb7b7c9971a11946f064"
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
