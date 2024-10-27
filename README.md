## APLIKASI PENGUJIAN HIPOTESIS MENGGUNAKAN RSHINY 
Aplikasi ini digunakan untuk memudahkan pengguna dalam menguji hipotesis menggunakan aplikasi berbasis web Rshiny

### Ruang lingkup pengujian Hipotesis pada aplikasi R-shiny yang akan dibuat mencakup tiga hal, yakni: 
1.	pengujian hipotesis terhadap Mean.
2.	pengujian hipotesis terhadap Proporsi.
3.	pengujian hipotesis terhadap Variansi.

## Bagian yang ada dalam Dashboard untuk Analisis Data.
1. Navigasi Sidebar – Menu navigasi utama aplikasi.
   ![sidebar](https://github.com/user-attachments/assets/2bdcd63b-d51d-4baf-be49-7b227f9c9f96)
2. Overview Dashboard – Tampilan ringkas data secara keseluruhan pada dashboard aplikasi.
![overview](https://github.com/user-attachments/assets/7f0c7524-0975-419b-b49c-c7fe7668c073)
3. Uji T Test – Visualisasi pengujian T untuk membandingkan variabel.
   ![uji T test](https://github.com/user-attachments/assets/66e7ae0d-d437-4d74-860b-05ef999dc930)
4. Uji Varians – Ilustrasi pengujian varians pada data yang dianalisis.
   ![uji varians test](https://github.com/user-attachments/assets/b2ac7603-c95d-44b4-bfa0-9b7044fe9618)
5. Uji Proporsi - Visualisasi pengujian proporsi pada data.
   ![proporsi test](https://github.com/user-attachments/assets/8925c378-8c56-4abd-80fb-4cacad25f15c)
6. Input Data – Menampilkan tampilan input data yang akan digunakan dalam aplikasi
   ![input data](https://github.com/user-attachments/assets/04b93b97-a5f4-46ca-b3c4-bd6fab2c1242)

## Percobaan pada aplikasi
1. Input data "jumlah balita dengan status gizi stunting di Surabaya"
   
2. Uji T Test
   ![coba uji t test](https://github.com/user-attachments/assets/5431f0c2-f04d-4c93-b135-ab78f9c85b86)
   Analisis :
   Pada Uji T-test dua sample yakni Varibel Pemeberian.Vit A 59 bln dan status gizi stunting. Berdasarkan hasil yang diperoleh, nilai p-value = 2.2e-16 < 0.05, maka H0 ditolak yang artinya bahwa Varibel Pemberian.Vit A 59 bln memiliki pengaruh yang signifikan terhadap varivale status gizi stunting. Data yang ditunjukkan dari kedua variable tersebut cenderung berditribusi normal yang ditunjukkan pada histogram di atas.

3. Uji Proporsi Test
   ![Uji coba proporsi](https://github.com/user-attachments/assets/a0d6560f-05f3-4cdd-941c-9c199a0a02b0)
   Analisis:
   Berdasarkan hasil yang diperoleh, nilai p-value = 7.522e-06 < 0.05, maka H0 ditolak yang artinya dari 15 sample sukses dari 50 sample nilai dari proporsi dalam H0 tidak sama dengan 0,1 melainkan memiliki estimasi sample sebesar p = 0.3.

4. Uji Varians Test
   ![uji varians varinas](https://github.com/user-attachments/assets/2e5a3945-60ce-471b-863c-47d186c9a469)
   Analisis:
   Berdasarkan hasil yang diperoleh, nilai p-value = 2.2e-16 < 0.05, maka H0 ditolak yang artinya terdapat pengaruh yang siginifikan dari kedua variable yang dipilih .
