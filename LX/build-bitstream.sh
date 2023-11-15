#!/bin/bash

if [ ! -x "$(pwd)/microwatt/LX/build-bitstream.sh" ]; then
  echo "Please run me from the directory that is the common parent of microwatt and mw"
  exit 0
fi

v=`which vivado`
if [ -x "$v" ]; then
    echo 'Vivado seems to be there, OK.'
else
    source /opt/Xilinx/Vivado/2019.1/settings64.sh
fi

cd mw
fusesoc library add microwatt ../microwatt

targets=("arty_a7-100" "genesys2")

echo 'Which target?'
for i in ${!targets[@]}; do
  echo "$i for ${targets[$i]}"
done
read N
T=${targets[$N]}
echo Ok, building $T
fusesoc run --build --target=$T  microwatt --no_bram --memory_size=0
status=$?
if [[ $status -ne 0 ]]; then
        echo Synthesis failed.
        exit 1
fi
cd ..

echo 'Flash the bitstream [y/N]?'
read F
if [ $F == "y" ]; then
    microwatt/openocd/flash-arty -f k325 -c genesys2  mw/build/microwatt_0/genesys2-vivado/microwatt_0.bit
fi

