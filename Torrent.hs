module Torrent where

data Torrent =
  Torrent { title :: String,
            size :: Int, -- in Bytes
            numFiles :: Int,
            tags :: [String],
            uploadDate :: String,
            uploader :: String,
            seeders :: Int,
            leechers :: Int,
            infoHash :: String,
            magnet :: String,
            info :: String,
            langSpoken :: String,
            langText :: String,
            description :: String
          }
{-}  | SimpleTorrent { title :: String,
                    size :: Int,
                    uploadDate :: String,
                    uploader :: String,
                    seeders :: Int,
                    leechers :: Int,
                    magnet :: String,
                  }
                  deriving(Eq, Show, Read)
-}
parseTorrentPage :: String -> Torrent
parseTorrentPage page = undefined

parseSearchPage :: String -> [Torrent]
parseSearchPage page = undefined
