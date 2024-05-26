#!/bin/bash

function manajemen_Zarchive {
    while true; do
        clear
        echo "------------------------------"
        echo "Manajemen Arsip"
        echo "------------------------------"
        echo "1. Kompres File"
        echo "2. Kompres Direktori"
        echo "3. Ekstrak File"
        echo "4. Kembali ke Menu Utama"
        echo "------------------------------"
        read -p "Masukkan Pilihan: " archive_choice

        case $archive_choice in
            1)
                while true; do
                    read -p "Masukkan nama file yang akan dikompres: " filename
                    read -p "Masukkan nama arsip (tanpa ekstensi): " archive
                    if [[ -f "$filename" ]]; then
                        tar -czf "${archive}.tar.gz" "$filename"
                        echo "File telah dikompres!"
                    else
                        echo "File tidak ditemukan!"
                    fi
                    read -p "Apakah Anda ingin mengompres file lain? (y/n): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            2)
                while true; do
                    read -p "Masukkan nama direktori yang akan dikompres: " dirname
                    read -p "Masukkan nama arsip (tanpa ekstensi): " archive
                    if [[ -d "$dirname" ]]; then
                        tar -czf "${archive}.tar.gz" "$dirname"
                        echo "Direktori telah dikompres!"
                    else
                        echo "Direktori tidak ditemukan!"
                    fi
                    read -p "Apakah Anda ingin mengompres direktori lain? (y/n): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            3)
                while true; do
                    read -p "Masukkan nama arsip yang akan diekstrak: " archive
                    read -p "Masukkan direktori tujuan ekstraksi: " targetdir
                    if [[ -f "$archive" ]]; then
                        mkdir -p "$targetdir"
                        tar -xzf "$archive" -C "$targetdir"
                        echo "Arsip telah diekstrak ke $targetdir!"
                        extracted_files=$(tar -tzf "$archive")
                        for file in $extracted_files; do
                            if [[ "$file" == *.sh ]]; then
                                chmod +x "$targetdir/$file"
                                echo "File shell script $file telah diatur agar dapat dieksekusi."
                            fi
                        done
                    else
                        echo "Arsip tidak ditemukan!"
                    fi
                    read -p "Apakah Anda ingin mengekstrak file lain? (y/n): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            4)
                break
                ;;
            *)
                echo "Pilihan tidak valid! Silakan coba lagi."
                ;;
        esac
        # read -p "Tekan enter untuk kembali ke menu manajemen arsip"
    done
}