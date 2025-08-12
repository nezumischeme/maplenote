module Maple (app) where

import Text.Blaze.Html
import Servant.API
import Servant.HTML.Blaze
import Servant.Server
import qualified Text.Blaze.Html5 as H
import qualified Text.Blaze.Html5.Attributes as A
import Crypto.BCrypt

type Index = "index"
  :> Get '[HTML] Html

type Login  = "login" :> Get '[HTML] Html

index :: Server Index
index = pure . H.docTypeHtml $ do
  H.title "Login"
  H.p (H.a H.! A.href "/login" $ "Login")

app :: IO ()
app = putStrLn "Hello world!"
