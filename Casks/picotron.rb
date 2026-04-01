require "cgi"

cask "picotron" do
  module Utils
    def self.lexaloffle_param(name)
      CGI.escape(ENV.fetch(name, ""))
    end
  end

  version "0.3.0b"
  sha256 "24491b3b94c8d0daf5d525e68b495cf45c2fea99fa4e1d0248e8eaf014aa6644"

  url "https://www.lexaloffle.com/dl/user/#{Utils.lexaloffle_param("HOMEBREW_LEXALOFFLE_EMAIL")}/#{Utils.lexaloffle_param("HOMEBREW_PICOTRON_URL_TOKEN")}/picotron_#{version}_osx.zip"
  name "Picotron"
  desc "Fantasy workstation for creating and sharing Lua apps"
  homepage "https://www.lexaloffle.com/picotron.php"

  livecheck do
    url "https://www.lexaloffle.com/dl/docs/picotron_changelog.txt"
    regex(/^\s+(\d+(?:\.\d+)+(?:[a-z]\d*)?):?\s*$/i)
  end

  app "picotron/Picotron.app"

  caveats <<~EOS
    Set your Lexaloffle credentials when installing this cask:

      HOMEBREW_LEXALOFFLE_EMAIL="name@example.com" \
      HOMEBREW_PICOTRON_URL_TOKEN="your-download-token" \
      brew install --cask picotron

    Or, without tapping first:

      HOMEBREW_LEXALOFFLE_EMAIL="name@example.com" \
      HOMEBREW_PICOTRON_URL_TOKEN="your-download-token" \
      brew install --cask dev-shelf/lexaloffle/picotron
  EOS

  # No zap stanza required
end
