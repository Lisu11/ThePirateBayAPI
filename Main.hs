module Main where

import System.Environment
import Network.Socket(withSocketsDo)
import Network.URI
import Network.HTTP.Conduit
import Data.Maybe
import Network
import Torrent

main = withSocketsDo $
  do args <- getArgs
     case args of
       ["download", url] -> downloadPage url
       _ -> return ()


downloadPage :: String -> IO()
downloadPage url =
  do page <- getContent url
     putStrLn page


getContent :: String -> IO (String) --TODO implement excepitions
getContent url =
  do res <- simpleHttp url -- This function will throwIO an HttpException for any response with a non-2xx status code (besides 3xx redirects up to a limit of 10 redirects)
     return $ show res
