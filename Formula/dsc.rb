class Dsc < Formula
  desc "Microsoft Desired State Configuration v3"
  homepage "https://github.com/PowerShell/DSC"
  version "3.0.0-preview.8"

  if Hardware::CPU.intel?
    sha256 "fc3aaa3f0a36f48d220726895bbf8a3375c43a926df3d3c57be873313846eeef"
    url "https://github.com/PowerShell/DSC/releases/download/v#{version}/DSC-#{version}-x86_64-apple-darwin.tar.gz"
  elsif Hardware::CPU.arm?
    sha256 "02378b85bde208238acc55290ef5b1aa3b5ca884ad514d7a6bc01334c287274c"
    url "https://github.com/PowerShell/DSC/releases/download/v#{version}/DSC-#{version}-aarch64-apple-darwin.tar.gz"
  end

  livecheck do
    url :url
    regex(/^v?(\d+(?:\.\d+)+(?:-\w+(?:\.\w+)*)?)$/i)
  end

  def install
    prefix.install Dir["*"]
    # Create a wrapper script
    (bin/"dsc").write <<~EOS
      #!/bin/bash
      cd #{prefix} && ./dsc "$@"
    EOS
    (bin/"dsc").chmod 0755
  end
end
