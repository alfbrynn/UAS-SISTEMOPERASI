#!/bin/bash

# deklarasi fungsi
function manajemen_file {
    while true; do
        clear
        echo "------------------------------"
        echo "Manajemen File"
        echo "------------------------------"
        echo "1. Lihat File"
        echo "2. Hapus File"
        echo "3. Salin File"
        echo "4. Pindahkan File"
        echo "5. Buat File"
        echo "6. Buat Direktori Baru"
        echo "7. Eksekusi File SH"
        echo "8. Tampilkan Informasi File"
        echo "9. Ubah Akses Izin File"
        echo "10. Edit File"
        echo "11. Kembali ke Menu Utama"
        echo "------------------------------"
        read -p "Masukkan Pilihan: " file_choice

        # menggunakan switch case untuk menangani pilihan user
        case $file_choice in
            1)
                while true; do
                    read -p "Masukkan direktori file: " dir
                    ls "$dir" # perintah ls dalam linux untuk menampilkan daftar file dalam direktori
                    read -p "Apakah Anda ingin melihat file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break # Jika pengguna input 'y' maka pengguna masih dalam loop jika memilih 't' maka pengguna keluar dari loop
                done
                ;;
            2)
                while true; do
                    read -p "Masukkan path file/folder yang akan dihapus: " path
                    rm -r "$path" # perintah rm dalam linux untuk menghapus file atau direktori
                    echo "File/Folder telah dihapus!"
                    read -p "Apakah Anda ingin menghapus file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            3)
                while true; do
                    read -p "Masukkan nama file yang akan disalin: " source # meminta pengguna memasukan nama file sumber
                    read -p "Masukkan tujuan salinan: " destination # memintah pengguna memasukkan tujuan salinan
                    if [[ -f "$source" ]]; then
                        cp "$source" "$destination" # menyalin file dari sumber ke tujuan
                        echo "File telah disalin!" # jika file sumber ada maka file akan di salin ke tujuan
                    else
                        echo "File sumber tidak ditemukan!" # jika file sumber tidak ada maka memberikan pesan kesalahan
                    fi
                    read -p "Apakah Anda ingin menyalin file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            4)
                while true; do
                    read -p "Masukkan nama file yang akan dipindahkan: " source
                    read -p "Masukkan tujuan: " destination
                    if [[ -f "$source" ]]; then
                        mv "$source" "$destination" # perintah mv pada linux untuk memindahkan file
                        echo "File telah dipindahkan!"
                    else
                        echo "File sumber tidak ditemukan!"
                    fi
                    read -p "Apakah Anda ingin memindahkan file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            5)
                while true; do
                    read -p "Masukkan nama file baru yang akan dibuat: " newfile
                    touch "$newfile" # perintah touch untuk membuat file baru
                    echo "File telah dibuat!"
                    read -p "Apakah Anda ingin membuat file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            6)
                while true; do
                    read -p "Masukkan nama direktori baru: " newdir
                    mkdir "$newdir" # perintah mkdir untuk membuat direktori baru
                    echo "Direktori telah dibuat!"
                    read -p "Apakah Anda ingin membuat direktori lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            7)
                while true; do
                    read -p "Masukkan nama file shell script yang akan dieksekusi: " script_file
                    if [[ -f "$script_file" && "$script_file" == *.sh ]]; then
                        chmod +x "$script_file" # perintah untuk memerikan izin eksekusi pada file
                        ./"$script_file" # ./ untuk mengeksekusi file shell script
                    else
                        echo "File shell script tidak ditemukan atau tidak valid!"
                    fi
                    read -p "Apakah Anda ingin mengeksekusi file shell script lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            8)
                while true; do
                    read -p "Masukkan nama file: " filename
                    if [[ -f "$filename" ]]; then # memeriksa apakah file yang ingin di eksekusi ada
                        stat "$filename" # menampilkan informasi detail tentang file
                    else
                        echo "File tidak ditemukan!"
                    fi
                    read -p "Apakah Anda ingin menampilkan informasi file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            9)
                while true; do
                    read -p "Masukkan nama file: " filename
                    if [[ -f "$filename" ]]; then
                        read -p "Masukkan izin baru (misal 755): " permission
                        chmod "$permission" "$filename" # chmod untuk mengubah izin akses file
                        echo "Izin file telah diubah!"
                    else
                        echo "File tidak ditemukan!"
                    fi
                    read -p "Apakah Anda ingin mengubah izin file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            10)
                while true; do
                    read -p "Masukkan nama file yang akan diedit: " edit_file
                    if [[ -f "$edit_file" ]]; then
                        nano "$edit_file"  # Menggunakan nano editor, karena editor nano lebih mudah
                        echo "File telah diedit!"
                    else
                        echo "File tidak ditemukan!"
                    fi
                    read -p "Apakah Anda ingin mengedit file lain? (y/t): " cont
                    [[ "$cont" != "y" ]] && break
                done
                ;;
            11)
                break
                ;;
            *)
                echo "Pilihan tidak valid! Silakan coba lagi."
                ;;
        esac
        # read -p "Tekan enter untuk kembali ke menu manajemen file"
    done
}