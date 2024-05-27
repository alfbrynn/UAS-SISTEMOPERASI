#!/bin/bash

# Panggil file kelas
source manajemen_file.sh
source manajemen_Zarchive.sh
source fitur_lainnya.sh

# Menu utama
# memulai loop tak terbatas yang membuat menu utama muncul kembali
# setelah setiap operasi selesai sampai user memilih opsi keluar
while true; do
    clear
    # perintah untuk membersihkan layar terminal
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
    # meminta user untuk memlih salah satu opsi di menu utama
    
    case $main_choice in
    # menentukan tindakan berdasarkan pilihan user
        1)
            manajemen_file
            ;;
        2)
            manajemen_Zarchive
            ;;
        3)
            fitur_lainnya
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
# new fix code Manajemen_Zarchive.sh fitur_lainnya.sh manajemen_file.sh
