class TimesheetAutomator < Formula
  desc "Biweekly timesheet generator with randomized daily hours and PDF export"
  homepage "https://github.com/Eyasluna/timesheet-automator"
  url "https://github.com/Eyasluna/timesheet-automator/releases/download/v0.1.2/timesheet-automator-0.1.2.tar.gz"
  sha256 "e42cbd1704314bcfd4bffcd74fb9c2cd4c52bb0509a112c63908d77a3c589047"
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
