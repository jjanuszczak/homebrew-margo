class Margo < Formula
  desc "Markdown-to-slide-deck CLI with a Hugo-like project model"
  homepage "https://github.com/jjanuszczak/margo"
  url "https://github.com/jjanuszczak/margo/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "4fa475ddacf179df56a25c787c4b4a8eac7979c9e9969cc6b0c37c01fb336200"
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
