#!/bin/bash

# Panggil file kelas
source manajemen_file.sh
source manajemen_Zarchive.sh
source fitur_lainnya.sh

# Menu utama
while true; do
    clear
    echo "------------------------------"
    echo "Selamat Datang di di Program saya"
    echo "------------------------------"
    echo "Pilih Menu VArchiver:"
    echo "1. Manajemen File"
    echo "2. Manajemen Arsip"
    echo "3. Fitur Tambahan"
    echo "4. Keluar"
    echo "------------------------------"
    read -p "Masukkan Pilihan: " main_choice

    case $main_choice in
        1)
            manajemen_file
            ;;
        2)
            manajemen_arsip
            ;;
        3)
            utilitas_lainnya
            ;;
        4)
            echo "Terima kasih telah menggunakan program saya, semoga harimu menyenangkan :)"
            break
            ;;
        *)
            echo "Pilihan tidak valid! Silakan coba lagi."
            read -p "Tekan enter untuk kembali ke menu utama"
            ;;
    esac
done
new fix code Manajemen_Zarchive.sh fitur_lainnya.sh manajemen_file.sh
