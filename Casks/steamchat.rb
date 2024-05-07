cask "steamchat" do
  version "0.1.2"
  sha256 "3418bccdd33a26f132fb6977d2f169dd1c8b4eaa338f337b15473479d1e5a0cd"

  url "https://github.com/bdeb1337/steamchat/releases/download/v#{version}/steamchat-#{version}-universal.dmg"
  name "steamchat"
  desc "Electron-based web wrapper for Steam Chat"
  homepage "https://github.com/bdeb1337/steamchat"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "steamchat.app"

  zap trash: "~/Library/Application Support/steamchat"
end
