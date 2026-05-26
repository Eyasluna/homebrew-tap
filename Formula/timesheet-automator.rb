class TimesheetAutomator < Formula
  desc "Biweekly timesheet generator with randomized daily hours and PDF export"
  homepage "https://github.com/Eyasluna/timesheet-automator"
  url "https://github.com/Eyasluna/timesheet-automator/releases/download/v0.1.1/timesheet-automator-0.1.1.tar.gz"
  sha256 "18138028b7d70b16ec4bf0f89a149cd36131d1b928d4e0a116a56dce10eb3bbf"
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
