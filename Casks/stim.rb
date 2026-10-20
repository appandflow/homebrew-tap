cask "stim" do
  version "0.2.4"
  sha256 "2a20be56750792dab65b64c021e7be150d5b9520c7b9a852c83073c333ee9316"

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
