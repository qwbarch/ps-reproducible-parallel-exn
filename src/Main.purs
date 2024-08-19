module Main where

import Prelude

import Effect
import Effect.Class
import Effect.Console
import Effect.Aff
import Effect.Aff as Aff
import Control.Parallel
import Control.Monad.Rec.Class

main :: Effect Unit
main = launchAff_ $ do
  void $ parOneOf
    [ forever $ delay (Milliseconds 1000.0) *> liftEffect (log "Hello world!")
    , Aff.throwError $ Aff.error "Oh no!"
    ]