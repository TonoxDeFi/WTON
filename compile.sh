#!/bin/bash
clear
echo -e "\e[32mBuilding...\e[0m"
func -SPA -o ./build/jetton-wallet.fif ./stdlib.fc ./src/math.func ./src/utils.func ./src/params.fc ./src/op-codes.fc ./src/jetton-utils.fc ./src/jetton-wallet.fc
func -SPA -o ./build/jetton-minter.fif ./stdlib.fc ./src/math.func ./src/utils.func ./src/params.fc ./src/op-codes.fc ./src/jetton-utils.fc ./src/jetton-minter.fc

echo "jetton-wallet: " && echo '"build/jetton-wallet.fif" include 2 boc+>B "build/jetton-wallet.boc" B>file' | fift -s
echo "jetton-minter: " && echo '"build/jetton-minter.fif" include 2 boc+>B "build/jetton-minter.boc" B>file' | fift -s
echo -e "\n\e[31mHex:\e[0m"

fift -s build/print-hex.fif
