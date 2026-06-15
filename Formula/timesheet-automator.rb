class TimesheetAutomator < Formula
  desc "Biweekly timesheet generator with randomized daily hours and PDF export"
  homepage "https://github.com/Eyasluna/timesheet-automator"
  url "https://github.com/Eyasluna/timesheet-automator/releases/download/v0.3.0/timesheet-automator-0.3.0.tar.gz"
  sha256 "3c6619898c8af699223e5ff5b99438981484732ef9fd655a23214414e5e9b175"
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
