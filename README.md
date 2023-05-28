This is an educational implementation of the ECDSA algorithms for public key generation and signing messages with a private key, for the [ChipWhisperer-Lite](https://rtfm.newae.com/Starter%20Kits/ChipWhisperer-Lite/).

It is **vulnerable by design** to side-channel attacks to facilitate learning about them and analyzing them. See our `jupyter/submit.ipynb` Jupyter Notebook for an example of how to compile and flash the code and run the example.

Specifically, the elliptic curve multiplication function `EccPoint_mult` in `firmware/crypto/micro-ecc-vulnerable/uECC.c` is vulnerable: the amount of times `EccPoint_add` is called is dependent on the bits in the secret key. This means the secret key can be retrieved by both timing analysis and power analysis attacks.
