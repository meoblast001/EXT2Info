-----------------------------------------------------------------------------
-- |
-- Module      : Main
-- Copyright   : (C) 2015 Braden Walters
--                   2015 Ricky Elrod
-- License     : MIT (see LICENSE file)
-- Maintainer  : Braden Walters <vc@braden-walters.info>
--               Ricky Elrod <ricky@elrod.me>
-- Stability   : experimental
-- Portability : ghc
module Main where

import Data.EXT2.Info
import Data.Functor
import System.Environment
import System.IO

main :: IO ()
main = do
  args <- getArgs
  case args of
    [fileName] -> withFile fileName ReadMode
                           (\handle -> (show <$> ext2Info handle) >>= putStrLn)
    _ -> error "Please specify a file name."
