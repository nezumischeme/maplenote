module Maple where

import Text.Blaze.Html
import Servant.API
import Servant.HTML.Blaze
import Servant.Server
import Servant
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Network.Wai.Handler.Warp
import System.IO
type Index = "index"
  :> Get '[HTML] Html

type Login  = "login" :> Get '[HTML] Html

index :: Server Index
index = pure . H.docTypeHtml $ do
  H.title "Login"
  H.p (H.a H.! A.href "/login" $ "Login")

run :: IO ()
run = do
  let port = 3000
      settings =
        setPort port $
        setBeforeMainLoop (hPutStrLn stderr ("listening on port " ++ show port)) $
        defaultSettings
  runSettings settings =<< mkApp

appApi :: Proxy Index
appApi = Proxy

mkApp :: IO Application
mkApp = return $ serve appApi index 