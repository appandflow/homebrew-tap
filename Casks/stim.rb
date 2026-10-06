cask "stim" do
  version "0.1.8"
  sha256 "2346595d296b03bd40cdf780d6535f9e8bbe47aadebd5f635ce4563c55cfbf5d"

  url "https://github.com/appandflow/stim/releases/download/desktop-v#{version}/Stim-#{version}.dmg"
  name "Stim"
  desc "Watch and control the simulators and emulators Stim runs"
  homepage "https://stim.appandflow.com/"

  livecheck do
    url "https://github.com/appandflow/stim/releases/download/desktop-latest/appcast.xml"
    strategy :sparkle, &:short_version
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Stim.app"

  zap trash: [
    "~/Library/Application Support/dev.stim.desktop",
    "~/Library/Application Support/Stim Desktop",
    "~/Library/Caches/dev.stim.desktop",
    "~/Library/HTTPStorages/dev.stim.desktop",
    "~/Library/Preferences/dev.stim.desktop.plist",
    "~/Library/Saved Application State/dev.stim.desktop.savedState",
  ]

  caveats <<~EOS
    Stim Desktop needs the stim command line tool:
      npm install --global stim
  EOS
end
