#/bin/bash

# Get LiteX at the SHA at which DRAM worked.

rm -rf migen
git clone https://github.com/m-labs/migen.git
cd migen
git checkout 7bc4eb1387b39159a74c1dbd1b820728e0bfbbaa
# for Python3.11
git cherry-pick 0fb91737090fe45fd764ea3f71257a4c53c7a4ae
python3 setup.py install --user
cd ..


rm -rf litex
git clone  git@github.com:shingarov/litex.git
cd litex
#git checkout amended-31afe  # fails to compile sdram.c
git checkout amended-9a4c5
python3 setup.py install --user
cd ..


rm -rf litedram
git clone https://github.com/enjoy-digital/litedram.git
cd litedram
git checkout 47a0d5fb9e552baa880afab57903a5966d1ee8a7
python3 setup.py install --user
cd ..


git clone --depth=1 https://github.com/litex-hub/litex-boards.git
cd litex-boards
git fetch --depth=1 origin 929e55d7e62b7430b917d8a28604f315d4bb64b5
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..


git clone --depth=1 https://github.com/enjoy-digital/liteiclink.git
cd liteiclink
git fetch --depth=1 origin 6756b4a7ba1b6474d0a4a3f8f9759baf282f9b06
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..


git clone --depth=1 https://github.com/enjoy-digital/litescope.git
cd litescope
git fetch --depth=1 origin 14e8af8dd95f96b917d25f7626e910fb1c108456
git reset --hard FETCH_HEAD
python3 setup.py install --user
cd ..


rm -rf liteeth
git clone https://github.com/enjoy-digital/liteeth.git
cd liteeth
git checkout 792013a1756ea50608726ee86989ec38cfc35a8b
python3 setup.py install --user
cd ..

