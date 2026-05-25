class TimesheetAutomator < Formula
  desc "Biweekly timesheet generator with randomized daily hours and PDF export"
  homepage "https://github.com/Eyasluna/timesheet-automator"
  url "https://github.com/Eyasluna/timesheet-automator/releases/download/v0.1.0/timesheet-automator-0.1.0.tar.gz"
  sha256 "93d8570aa1a1b7c6ab67eb290c2d6cae468bb7cf46f2db0350111869ebace801"
  license "MIT"

  depends_on "node"

  def install
    libexec.install Dir["*"]
    (bin/"timesheet-automator").write <<~SH
      #!/bin/bash
      exec "#{Formula["node"].opt_bin}/node" "#{libexec}/bin/timesheet-automator" "$@"
    SH
    chmod 0755, bin/"timesheet-automator"
  end

  test do
    assert_predicate libexec/"dist/index.html", :exist?
    assert_predicate libexec/"bin/timesheet-automator", :exist?
  end
end
