#!/bin/sh -ex

(cat <<EOF
-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEGwOduaRxii1pneAxrGEsMSDDRpUFAmkLP7oACgkQrGEsMSDD
RpV6kBAAhSnOm/BH956S53ZeQ8AU/pQ/gm+ONtMItkle4F1geO2rv0tOttHudq4M
ZvAlkL58k3IfIKMWOh0eLKCVR5Ljz+nvWHYtemNNFe1vI+wHE4wHuac/hB1DoQaP
8oXwZPYDa6jd93LPCS6b/oTeewSdQu2ZjaPz5XTbG/K9NOghGcidqayXm8X6A4ZI
eOIQS4jvlTwYI9Ef0N/U6Adl2gd/6xrXeDssW887SPnSOKP7fCdO2M8gwO7S4Rrw
UgWHyV3M+WnpLrCLDhrsc0q/FqE5P05/zJy030lJCeL9QzqRsPBsqxpNTitXjkxA
4nvhQkglBCmUqlJH76nBZhH/9TLpyN9mgDgJoPVGB/mSJhVEAJCqAYxr7U1BDIYq
9n+JiCoqqIZDwValIfVsxHfMHIRg99XjTLMs3elIymhGsBaNHk9va40XorY5L9ie
AYqJ7nID4BV2IkeJ9VfZGXfW0C6+XaLlrRN8avc+1pKrsJEhSHFfmlaHYbY09Vx7
Czb4mBpRV7L9OJ/HPpwuYbzFlWNJPykcMclAh2PEP07gT0HGqP9Nj8JYqOLuPNfS
ssZtQ3LpmWWooWkHQHgg6HHIMee7tWhRWWFyfia3KY6Z9FOXORuVjpmRIbh8aJte
+QL2K9QFftOLeut1oePlkEVrDJPCPTVGT+eeJfqQ6c31ZHDra7g=
=eeDb
-----END PGP SIGNATURE-----
EOF
) > renderdoc.tar.gz.sig

wget -O renderdoc.tar.gz https://renderdoc.org/stable/1.41/renderdoc_1.41.tar.gz

gpg --verify renderdoc.tar.gz.sig

tar -x -z -f renderdoc.tar.gz --strip-components=2 renderdoc_1.41/lib/librenderdoc.so

rm -f renderdoc.tar.gz
rm -f renderdoc.tar.gz.sig
