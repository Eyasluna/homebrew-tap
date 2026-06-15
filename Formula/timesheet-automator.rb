class TimesheetAutomator < Formula
  desc "Biweekly timesheet generator with randomized daily hours and PDF export"
  homepage "https://github.com/Eyasluna/timesheet-automator"
  url "https://github.com/Eyasluna/timesheet-automator/releases/download/v0.2.1/timesheet-automator-0.2.1.tar.gz"
  sha256 "f1e0a7bceaeaaa84b9995c7347e35aa2f1875510da9ba10fed3a4e6939b18716"
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
