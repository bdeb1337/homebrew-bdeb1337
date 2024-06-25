cask "dsc" do
    arch arm: "aarch64", intel: "x86_64"
  
    version "v3.0.0-preview.8"
    sha256 arm:   "02378b85bde208238acc55290ef5b1aa3b5ca884ad514d7a6bc01334c287274c",
           intel: "fc3aaa3f0a36f48d220726895bbf8a3375c43a926df3d3c57be873313846eeef"
  
    url "https://github.com/PowerShell/DSC/releases/download/#{version}/DSC-#{version}-#{arch}-apple-darwin.tar.gz"
    name "DSC"
    desc "Microsoft Desired State Configuration v3"
    homepage "https://github.com/PowerShell/DSC"
  
    livecheck do
      url :url
      regex(/^v?(\d+(?:\.\d+)+)(?:-\w+(?:\.\w+)*)?$/i)
    end
  
    depends_on macos: ">= :mojave"
  
    def install
        # Homebrew unpacks the tar.gz automatically, so just move the contents to the Cellar
        prefix.install Dir["*"]
        
        # If there are specific executables, link them
        bin.install_symlink prefix/"dsc"
    end
  end