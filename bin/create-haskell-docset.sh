rm -Rf haskell-lts-10.0.docset
stack exec -- haddocset -t haskell-lts-10.0.docset create --CFBundleName=Haskell-lts-10.0 --Icon="~/fs/hs/icon.png" $(stack path --snapshot-pkg-db)/*.conf
