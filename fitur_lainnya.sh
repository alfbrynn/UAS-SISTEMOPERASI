#!/bin/sh

function fitur_lainnya {
    while true; do
        clear
        echo "------------------------------"
        echo "Fitur Lainnya"
        echo "------------------------------"
        echo "1. Cek Koneksi Internet"
        echo "2. Tampilkan Waktu Saat Ini"
        echo "3. Tampilkan Disk Usage"
        echo "4. Kembali ke Menu Utama"
        echo "------------------------------"
        read -p "Masukkan Pilihan: " util_choice

        case $util_choice in
            1)
                echo "Cek koneksi internet..."
                TEST_IP="8.8.8.8"
                ping -c 1 -W 5 $TEST_IP > /dev/null 2>&1
                if [ $? -eq 0 ]; then
                    echo "Jaringan internet terhubung."
                else
                    echo "Jaringan internet tidak terhubung."
                fi
                # read -p "Tekan enter untuk melanjutkan"
                ;;
            2)
                echo "Waktu saat ini:"
                date
                # read -p "Tekan enter untuk melanjutkan"
                ;;
            3)
                echo "Total penggunaan disk di direktori saat ini:"
                du -sh ./*
                # read -p "Tekan enter untuk melanjutkan"
                ;;
            4)
                break
                ;;
            *)
                echo "Pilihan tidak valid! Silakan coba lagi."
                ;;
        esac
        read -p "Tekan enter untuk kembali ke menu fitur lainnya"
    done
}