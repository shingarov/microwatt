#/bin/bash

# Get LiteX at the SHA at which DRAM worked.

git clone --depth=1 https://github.com/m-labs/migen.git
cd migen
git fetch --depth=1 origin 7bc4eb1387b39159a74c1dbd1b820728e0bfbbaa
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..

git clone --depth=1 https://github.com/enjoy-digital/litex.git
cd litex
git fetch --depth=1 origin 2ec4604c41a828634be9029babe17281d4be0825
git reset --hard FETCH_HEAD
cp ../fix-compilation.patch .
patch -p1 <fix-compilation.patch
python3 setup.py install --user
cd ..

git clone --depth=1 https://github.com/enjoy-digital/litedram.git
cd litedram
git fetch --depth=1 origin 47a0d5fb9e552baa880afab57903a5966d1ee8a7
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..

git clone --depth=1 https://github.com/litex-hub/litex-boards.git
cd litex-boards
git fetch --depth=1 origin 929e55d7e62b7430b917d8a28604f315d4bb64b5
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..

# liteeth
# 792013a1756ea50608726ee86989ec38cfc35a8b

# nmigen d964ba9cc45490b141c8c4c4c3d8add1a26a739d

