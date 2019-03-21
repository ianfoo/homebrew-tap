# This file was generated by GoReleaser. DO NOT EDIT.
class Lab < Formula
  desc "Lab wraps Git or Hub, making it simple to clone, fork, and interact with repositories on GitLab"
  homepage "https://github.com/zaquestion/lab"
  url "https://github.com/zaquestion/lab/releases/download/v0.15.3/lab_0.15.3_darwin_amd64.tar.gz"
  version "0.15.3"
  sha256 "592227bb418a41ce94183e7550f105cd2e34586686fd97832b8d965c986979e6"

  def install
    bin.install "lab"
  end

  test do
    system "git", "init"
    %w[haunted house].each { |f| touch testpath/f }
    system "git", "add", "haunted", "house"
    system "git", "commit", "-a", "-m", "Initial Commit"
    system "git", "config", "--local", "--add", "gitlab.host", "http://example.com"
    system "git", "config", "--local", "--add", "gitlab.user", "test"
    system "git", "config", "--local", "--add", "gitlab.token", "test"
    assert_equal "haunted\nhouse", shell_output("#{bin}/lab ls-files").strip
  end
end
