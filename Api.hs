module Api where
import qualified Data.Map as M

data Category =
      All
    | ApplicationsAll
    | ApplicationsAndroid
    | ApplicationsHandheld
    | ApplicationsIos
    | ApplicationsMac
    | ApplicationsOther
    | ApplicationsUnix
    | ApplicationsWindows
    | AudioAll
    | AudioAudioBooks
    | AudioFlac
    | AudioMusic
    | AudioOther
    | AudioSoundClips
    | GamesAll
    | GamesAndroid
    | GamesHandheld
    | GamesIos
    | GamesMac
    | GamesOther
    | GamesPc
    | GamesPsx
    | GamesWii
    | OtherComics
    | OtherCovers
    | OtherEbooks
    | OtherOther
    | OtherPhysibles
    | OtherPictures
    | PornAll
    | PornGames
    | PornHdMovies
    | PornMovieClips
    | PornMovies
    | PornMoviesDvdr
    | PornOther
    | PornPictures
    | VideoAll
    | VideoHandheld
    | VideoHdMovies
    | VideoHdTvShows
    | VideoMovieClips
    | VideoMovies
    | VideoMoviesDvdr
    | VideoMusicVideos
    | VideoOther
    | VideoThreeDimensions
    | VideoTvShows
    deriving(Show, Eq, Ord)

data Order = NameDes
           | NameAsc
           | UploadedDes
           | UploadedAsc
           | SizeDes
           | SizeAsc
           | SeedDes
           | SeedAsc
           | PeerDes
           | PeerAsc
           | UploaderDes
           | UploaderAsc
           | TypeDes
           | TypeAsc
           deriving(Show, Eq, Ord)

data QueryAttribiutes =
  Attributes { categories :: Maybe [Category],
               order :: Maybe Order,
               page :: Maybe Page,
               domain :: Maybe String
             }
             deriving(Show, Eq)
type Page = Int

categoryCode :: M.Map Category Int
categoryCode = M.fromList [(All, 0), (ApplicationsAll, 300), (ApplicationsAndroid, 306), (ApplicationsHandheld, 304), (ApplicationsIos, 305), (ApplicationsMac, 302), (ApplicationsOther, 399), (ApplicationsUnix, 303), (ApplicationsWindows, 301), (AudioAll, 100), (AudioAudioBooks, 102),(AudioFlac, 104), (AudioMusic, 101), (AudioOther, 199), (AudioSoundClips, 103), (GamesAll, 400), (GamesAndroid, 408), (GamesHandheld, 406), (GamesIos, 407), (GamesMac, 402), (GamesOther, 499), (GamesPc, 401), (GamesPsx, 403), (GamesWii, 405), (OtherComics, 602),(OtherCovers, 604), (OtherEbooks, 601), (OtherOther, 699), (OtherPhysibles, 605), (OtherPictures, 603), (PornAll, 500), (PornGames, 504), (PornHdMovies, 505), (PornMovieClips, 506), (PornMovies, 501), (PornMoviesDvdr, 502), (PornOther, 599), (PornPictures, 503), (VideoAll, 200), (VideoHandheld, 206), (VideoHdMovies, 207), (VideoHdTvShows, 208), (VideoMovieClips, 204), (VideoMovies, 201), (VideoMoviesDvdr, 202), (VideoMusicVideos, 203), (VideoOther, 299), (VideoThreeDimensions, 209), (VideoTvShows, 205)]

orderCode :: M.Map Order Integer
orderCode = M.fromList [(NameDes, 1), (NameAsc, 2), (UploadedDes, 3), (UploadedAsc, 4), (SizeDes, 5), (SizeAsc, 6), (SeedDes, 7), (SeedAsc, 8), (PeerDes, 9), (PeerAsc, 10),(UploaderDes, 11), (UploaderAsc, 12), (TypeDes, 13), (TypeAsc, 14)]

defaultDomain :: String
defaultDomain = "https://thepiratebay.co.in"

{-createSearchURL :: String -> String
createURL query = let attr = Attributes {categories=Nothing, order=Nothing, page=Nothing, domain=Nothing}
                  in createComplexSearchURL query attr
-}
createComplexSearchURL :: String -> QueryAttribiutes -> String
createComplexSearchURL query attrs = undefined

createBrowseURL :: String -> QueryAttribiutes -> String
createBrowseURL query attrs = undefined

createRecentURL :: String -> String
createRecentURL query = undefined

createTopURL :: String -> QueryAttribiutes -> String
createTopURL query attrs = undefined

createRecentTopURL :: String -> QueryAttribiutes -> String
createRecentTopURL query attrs = undefined
