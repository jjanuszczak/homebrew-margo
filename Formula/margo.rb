class Margo < Formula
  desc "Markdown-to-slide-deck CLI with a Hugo-like project model"
  homepage "https://github.com/jjanuszczak/margo"
  url "https://github.com/jjanuszczak/margo/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "19b15a50f0455d0ae437ea2af9f58c3200daef7bc24082e48117191e8524ba40"
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
