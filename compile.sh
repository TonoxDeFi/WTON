#!/bin/bash
clear
echo -e "\e[32mBuilding...\e[0m"
func -SPA -o ./build/minter.fif ./src/minter.func
func -SPA -o ./build/wallet.fif ./src/wallet.func

echo "minter: " && echo '"build/minter.fif" include 2 boc+>B "build/minter.boc" B>file' | fift -s
echo "wallet: " && echo '"build/wallet.fif" include 2 boc+>B "build/wallet.boc" B>file' | fift -s
echo -e "\n\e[31mHex:\e[0m"

fift -s build/print-hex.fif
