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

