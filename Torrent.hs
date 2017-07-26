module Torrent where

import Text.XML.HaXml
import Text.XML.HaXml.Html.Parse
import Text.XML.HaXml.Html.Generate(showattr)
import Safe(headMay)
import Data.Maybe

data Torrent = Torrent {title :: String,
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
             | SimpleTorrent {title :: String,
                              size :: Int,
                              uploadDate :: String,
                              uploader :: String,
                              seeders :: Int,
                              leechers :: Int,
                              magnet :: String,
                              link :: String
             }
             deriving(Eq, Show, Read)

parseTorrentPage :: String -> String -> Torrent
parseTorrentPage page name =
  Torrent {
    title = getTitle mainContent,
    size = getSize mainContent,
    numFiles = getNumFiles mainContent,
    tags = getTags mainContent,
    uploadDate = getDate mainContent,
    uploader = getUploader mainContent,
    seeders = getSeeders mainContent,
    leechers = getLeechers mainContent,
    infoHash = getInfoHash mainContent,
    magnet = getMagnet mainContent,
    info = getInfo mainContent,
    langSpoken = getLangSp mainContent,
    langText = getLangTx mainContent,
    description = getDesc mainContent
  }  where
      parseRes = htmlParse name page
      doc = getContent parseRes
      mainContent = getMainContent doc

      getContent :: Document -> Content
      getContent (Document _ _ el _) = CElem el

getMainContent :: Content -> Content
getMainContent doc = let mainFilter = keep /> tag "body" /> tag "div"
                         divs = mainFilter doc
                         contentDiv = getDivForId "content" divs
                         divs' = (keep /> tag "div") contentDiv
                     in
                      getDivForId "main-content" divs'

getDivForId :: String -> [Content] -> Content
getDivForId idN divs = head $ filter compId divs
                  where
                    compId :: Content -> Bool
                    compId = \d -> case headMay $ showattr "id" d of Nothing -> False
                                                                     Just idd -> idd == idN

parseSearchPage :: String -> [SimpleTorrent]
parseSearchPage page = undefined
