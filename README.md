:eyeglasses: miso-optics
============================

This is an adaptor package for using [optics](hackage.haskell.org/packages/optics) with [miso](https://github.com/dmjio/miso) data [Binding](https://haddocks.haskell-miso.org/miso/Miso-Binding.html).

Created by [@georgefst](https://github.com/georgefst).

### Usage

```haskell
import Miso.Optics ((<--->), (<---), (--->))
```

## Build

```shell
cabal build
```

```shell
nix develop --command bash -c 'cabal build'
```

# Develop

```shell
nix develop
```
