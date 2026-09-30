cask "stim" do
  version "0.1.0"
  sha256 "503a52b442c8fea5951808d5e98613f54c53be2355f50461cb48321692f5233f"

  url "https://github.com/appandflow/stim/releases/download/desktop-v#{version}/Stim-#{version}.dmg"
  name "Stim"
  desc "Watch and control the simulators and emulators Stim runs"
  homepage "https://stim.appandflow.com/"

  livecheck do
    url "https://github.com/appandflow/stim/releases/download/desktop-latest/appcast.xml"
    strategy :sparkle
  end

  depends_on macos: ">= :sonoma"

  app "Stim.app"

  zap trash: "~/Library/Preferences/dev.stim.desktop.plist"
end
