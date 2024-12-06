import 'package:flutter/material.dart';

class Vertebrata extends StatelessWidget {
  const Vertebrata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kembali'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Vertebrata adalah kelompok hewan yang memiliki tulang belakang. Vertebrata dilengkapi tali punggung/penguat rangka (korda dorsalis) dan menjadi bagian dari Filum Chordata. Total ada lima kelas pada kategori vertebrata yaitu Pisces, Amfibi, Reptilia, Aves, dan Mamalia.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 30),
                vertebrataCategory(
                  'Pisces',
                  'Pisces tergolong sebagai vertebrata berdarah dingin dan berhabitat di dalam air. Hewan jenis ini menggunakan insang untuk membantunya bernapas. Agar bisa bergerak di perairan, Pisces juga dilengkapi dengan ekor dan sirip. Ciri khas lain dari Pisces yaitu tubuhnya ditutupi oleh sisik dan berkembang biak dengan cara bertelur. Menurut jenis tulang penyusun tubuh dan keberadaan rahangnya, ikan dikelompokkan menjadi tiga ordo yaitu Osteichthyes, Chondrichthyes, dan Agnatha. Adapun contoh hewan yang tergolong sebagai Pisces yaitu ikan-ikanan, lobster, dan udang.',
                  'lib/images/pisces.jpg', 
                ),
                const SizedBox(height: 30),
                vertebrataCategory(
                  'Amfibi',
                  'Asal usul dari kata Amfibi yaitu Amphi yang berarti rangkap dan Bios yang artinya hidup. Seperti yang kamu tahu, Amfibi merupakan sebutan bagi hewan vertebrata yang dapat hidup di dua tempat, yakni daratan dan perairan. Agar bisa menyesuaikan diri dengan tempat tinggalnya, Amfibi juga dilengkapi dengan dua alat pernapasan, paru-paru dan insang. Hewan ini bersifat ovipar atau bertelur dan umumnya mengalami metamorfosis secara sempurna. Terdapat tiga ordo yang masuk dalam kategori Amfibi, di antaranya Anura, Caudata, dan Gymnophiona.',
                  'lib/images/amfibi.jpg', 
                ),
                const SizedBox(height: 30),
                vertebrataCategory(
                  'Reptilia',
                  'Hewan yang melata atau merayap adalah ciri dari kelas Reptilia. Sama seperti Pisces, Reptilia juga disebut sebagai hewan berdarah dingin, meskipun sebagian besar habitatnya di daratan. Reptilia umumnya memiliki struktur tubuh lengkap, kecuali ular yang tidak memiliki kaki. Beberapa Reptilia berkembang biak dengan cara bertelur (ovipar), tetapi ada juga reptil yang bertelur dan melahirkan (ovovivipar). Karakteristik lain dari Reptilia yaitu tubuhnya terlindungi oleh zat tanduk dan kulit bersisik. Hewan ini memiliki empat ordo di dalamnya yakni Testudinata, Squamata, Crocodylia, dan Rhynchocephalia.',
                  'lib/images/reptilia.jpg', 
                ),
                const SizedBox(height: 30),
                vertebrataCategory(
                  'Aves',
                  'Aves identik dengan tubuhnya yang dipenuhi bulu. Selain berfungsi untuk melindungi tubuh, bulu pada Aves juga berperan dalam menjaga keseimbangan saat terbang. Sebagai hewan berdarah panas, Aves memproduksi keringat untuk mengatur suhu tubuhnya. Sekalipun biasanya Aves memiliki kemampuan terbang, beberapa hewan di kategori ini tidak dibekali kemampuan melayang di udara seperti ayam dan bebek. Aves termasuk hewan ovipar atau berkembang biak dengan cara bertelur.',
                  'lib/images/aves.jpg', 
                ),
                const SizedBox(height: 30),
                vertebrataCategory(
                  'Mamalia',
                  'Hewan-hewan Mamalia ditandai dengan adanya kelenjar susu pada tubuhnya. Oleh karena itu, Mamalia kerap disebut sebagai hewan menyusui. Pada bagian kulitnya terdapat kelenjar minyak, kelenjar keringat, dan ditutupi rambut. Untuk menghasilkan keturunan, sebagian besar Mamalia berkembang biak secara melahirkan. Hewan yang umumnya berhabitat di daratan ini termasuk hewan homoioterm atau hewan berdarah panas.',
                  'lib/images/mamalia.jpg', 
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget for each vertebrata category
  Widget vertebrataCategory(String title, String description, String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 15),
        Image.asset(
          imageUrl,
          height: 250,
          width: double.infinity,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              height: 250,
              color: Colors.grey,
              child: const Center(
                child: Text('Gambar tidak tersedia'),
              ),
            );
          },
        ),
        const SizedBox(height: 15),
        Text(
          description,
          style: const TextStyle(fontSize: 14),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
