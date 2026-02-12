-----------------------------------------------------------------------------
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE FlexibleInstances     #-}
{-# LANGUAGE FlexibleContexts      #-}
{-# LANGUAGE OverloadedStrings     #-}
{-# LANGUAGE RecordWildCards       #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Miso.Optics
-- Copyright   :  2016-2025 (C) dmjio
-- License     :  BSD3-style (see the file LICENSE)
-- Maintainer  :  David M. Johnson <code@dmj.io>
-- Stability   :  experimental
-- Portability :  non-portable
--
-- Data t'Binding' combinators specialized to the [optics](hacakge.haskell.org/pacakges/optics) library.
--
----------------------------------------------------------------------------
module Miso.Optics
  ( -- *** Combinators
    (<--->)
  , (--->)
  , (<---)
  ) where
----------------------------------------------------------------------------
import           Miso (Binding)
import qualified Miso.Binding as B
import           Miso.Lens (fromVL)
----------------------------------------------------------------------------
import           Optics
----------------------------------------------------------------------------
-- | Bidirectional t'Binding'
(<--->) :: (Is k1 A_Lens, Is k2 A_Lens) => Optic' k1 is1 parent a -> Optic' k2 is2 model a -> Binding parent model
l1 <---> l2 = Miso.Lens.fromVL (toLensVL l1) B.<--> Miso.Lens.fromVL (toLensVL l2)
----------------------------------------------------------------------------
-- | Unidirectional `ParentToChild` t'Binding'
(--->) :: (Is k1 A_Getter, Is k2 A_Setter) => Optic' k1 is1 parent a -> Optic' k2 is2 model a -> Binding parent model
l1 ---> l2 = (^. l1) `B.ParentToChild` (l2 .~)
----------------------------------------------------------------------------
-- | Unidirectional `ChildToParent` t'Binding'
(<---) :: (Is k1 A_Setter, Is k2 A_Getter) => Optic' k1 is1 parent a -> Optic' k2 is2 model a -> Binding parent model
l1 <--- l2 = (l1 .~) `B.ChildToParent` (^. l2)
----------------------------------------------------------------------------
