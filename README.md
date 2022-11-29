1. Anggota kelompok:
Akbar Firdaus (2106651856)
Alifio Fathan Haryanto (2106653483)
Alyssa Larasati (2106656125)
Arya Daniswara Khairan (2106702781)
Bintang Pratama (2106751373)
Fauzan Firzandy Khifzan (2106702756)

2. Deskripsi Aplikasi 
Nama : Agritara
Cerita Aplikasi : 
Melihat banyaknya permasalahan pada produksi bahan pokok di Indonesia membuat harga beberapa bahan pokok menjadi lebih mahal. Pada suatu daerah mungkin ada yang berhasil membuat panen bahan pokok dan ada juga yang terjadi gagal panen. Oleh karena itu, kami membuat suatu website bernama Agritara untuk menyimpan informasi hasil panen bahan pokok dari berbagai daerah di Indonesia yang telah diinput oleh petani masing-masing daerah mengenai kuantitas bahan-bahan pokok yang berhasil panen. Pemerintah suatu daerah yang kekurangan bahan pokok tertentu dapat melakukan request ke pemerintah daerah lain yang berhasil memproduksi bahan pokok dengan jumlah cukup banyak dan tidak kekurangan bahan pokok tersebut. Dengan hadirnya aplikasi ini, diharapkan bahwa harga bahan pokok pada setiap daerah di Indonesia dapat stabil pada setiap waktu dan kebutuhan masyarakat pada setiap daerah di Indonesia terhadap bahan pokok dapat tercukupi.

Fungsi : Untuk membantu pemerintah dalam pemerataan distribusi bahan pokok di Indonesia
 
  Peran User : 
  - Petani : Untuk memberi informasi atas bahan-bahan pokok yang berhasil di produksi dari suatu daerah
  - Pemda : Untuk meminta bahan pokok yang dibutuhkan dari suatu daerah
  
3. Daftar Modul :
  - Halahan utama (Alyssa Larasati)
  - Login (Alifio Fathan Haryanto)
  - Halaman utama petani (Akbar Firdaus)
  - Halaman pemerintah (Fauzan Firzandy Khifzan)
  - Input petani (Arya Daniswara Khairan)
  - Input pemerintah (Bintang Pratama)
  
 4. Alur pengintegrasian dengan web service untuk terhubung dengan aplikasi web yang sudah dibuat saat Proyek Tengah Semester
 - Membuat model class berdasarkan response data yang ingin diambil saat melakukan pemanggilan web service dengan pendefinisian model yang disesuaikan dengan setiap modul yang dibuat oleh masing-masing anggota kelompok.
- Membuat sebuah API yang dapat mengembalikan response berbentuk JSON. Kemudian implementasikan method GET yang akan menampilkan data dan mengirim input menggunakan method POST agar dapat meng-update data yang baru, serta diintegrasi dengan cara menggunakan konsep async HTTP.
- Melakukan data fetching dari web service dengan melakukan HTTP GET request serta iterasi data untuk ditampilkan pada aplikasi melalui FutureBuilder. 

