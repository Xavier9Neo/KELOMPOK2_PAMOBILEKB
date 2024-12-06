import 'package:flutter/material.dart';

class Invertebrata extends StatelessWidget {
  const Invertebrata({super.key});

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
                  'Invertebrata merupakan sebutan untuk hewan yang tidak memiliki tulang belakang. Jenis ini terbagi lagi ke dalam 8 filum yaitu Porifera, Coelenterata/Cnidaria, Platyhelminthes, Nemathelminthes, Annelida, Mollusca, Echinodermata, dan Arthropoda.',
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Porifera',
                  'Porifera adalah hewan spons atau berongga yang berhabitat di perairan. Dikutip dari Encyclopedia Britannica, setidaknya ada 5.000-an spesies spons yang tersebar di seluruh perairan di dunia. Filum Porifera dikenal sebagai hewan paling sederhana karena termasuk monoblastik atau hanya memiliki lapisan tubuh tunggal tanpa jaringan yang sejati. Uniknya lagi Porifera merupakan hermafrodit, yaitu makhluk yang mempunyai dua jenis kelamin. Sperma pada Porifera akan diproduksi oleh sel leher/sel koanosit, sedangkan sel telur dihasilkan oleh sel amoeboid. Berdasarkan penyusun rangka tubuhnya, Filum Porifera dibedakan lagi menjadi tiga kelas yaitu Demospongiae, Calcarea, dan Hexactinellida. Beberapa nama hewan yang termasuk Porifera adalah Sycon, Clathrina, dan Spongia.',
                  'lib/images/porifera.jpg',
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Cnidaria (Coelenterata)',
                  'Diambil dari bahasa Yunani Cnidos yang artinya jarum penyengat, Cnidaria adalah kelompok hewan invertebrata yang memiliki sel penyengat atau disebut knidosit. Sel ini nantinya dipakai oleh Cnidaria untuk menangkap mangsa maupun melindungi diri dari pemangsa. Segara spesifik, sel penyengat Cnidaria memiliki organel menyerupai kapsul dan di dalamnya terdapat nematokis. Nematokis sendiri adalah helaian benang yang mampu menembus jaringan para mangsanya. Bicara soal habitat Cnidaria, sebagian besar hewan kategori ini hidup di laut, kecuali Hydra yang berhabitat di air tawar. Menurut bentuk tubuhnya, Cnidaria dikelompokkan menjadi tiga kelas yaitu Hydrozoa, Scyphozoa, dan Anthozoa.',
                  'lib/images/cnidaria.jpg',
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Platyhelminthes',
                  'Dalam bahasa Yunani Platyhelminthes berarti cacing pipih. Hewan yang bersifat hermaprodit ini secara umum menjadi endoparasit bagi hewan lain bahkan di tubuh manusia sekalipun. Meski begitu ada juga Platyhelminthes yang berhabitat di perairan, baik air tawar maupun air laut. Menariknya, Platyhelminthes didefinisikan sebagai triploblastik–makhluk yang tubuhnya tersusun atas tiga lapisan yaitu Endoderm, Mesoderm, dan Ektoderm. Lapisan Endoderm bertugas membentuk gastrovaskuler atau saluran pencernaan, sedangkan Mesoderm adalah tempat terbentuknya jaringan ikat, jaringan otot, dan alat reproduksi. Sementara itu, Ektoderm berfungsi membentuk kutikula dan epidermis. Platyhelminthes dibedakan menjadi tiga kelas yaitu Turbellaria, Trematoda, dan Cestoda.',
                  'lib/images/platyhelminthes.jpg',
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Nemathelminthes',
                  'Masih bicara tentang jenis cacing, Nemathelminthes merupakan sebutan untuk cacing yang memiliki bentuk tubuh panjang dan bulat atau gilig. Ciri lain dari hewan ini adalah tubuhnya tidak beruas-ruas dan memiliki pseudocoelom (rongga tubuh semu). Jika dibandingkan dengan Platyhelminthes, sistem pencernaan pada Nemathelminthes terbilang lebih lengkap yaitu terdiri atas mulut, faring, usus, serta anus. Sama seperti Platyhelminthes, Nemathelminthes juga termasuk hewan triploblastik dan beberapa di antaranya hidup sebagai parasit. Nemathelminthes dibedakan menjadi dua kelas yakni Nematoda dan Nematomorpha',
                  'lib/images/nemathelminthes.jpg',
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Annelida',
                  'Annelida adalah sebutan untuk cacing yang bentuk tubuhnya terlihat beruas atau memiliki segmen. Segmen pada Annelida dikenal sebagai Annuli dan dipisahkan dengan Septa–dinding pemisah yang melintang. Tak jauh berbeda dari Platyhelminthes dan Nemathelminthes, Filum Annelida juga termasuk triploblastik dan mempunyai rongga tubuh sejati atau Coelomata. Ciri lain dari hewan ini adalah memiliki sistem pencernaan yang sudah sempurna, terdapat kutikula tipis pada tubuhnya, dan termasuk hermaprodit. Annelida dapat melakukan reproduksi secara seksual dengan cara konjugasi dan aseksual dengan cara fragmentasi. Berdasarkan ciri-ciri seta (rambut kaku) pada tubuhnya, Annelida diklasifikasikan menjadi tiga kelas yaitu Hirudinea, Oligochaeta, dan Polychaeta.',
                  'lib/images/annelida.jpg',
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Mollusca',
                  'Mollusca adalah hewan lunak yang masuk ke dalam kelompok triploblastik dan memiliki selomata atau rongga sejati. Pada umumnya Mollusca memiliki cangkang seperti siput dan kerang-kerangan. Namun, ada juga hewan Mollusca yang tidak bercangkang misalnya cumi-cumi, gurita, dan sotong. Mollusca termasuk hewan hermafrodit yang mana dalam satu tubuh terdapat dua jenis kelamin. Untuk proses reproduksinya, Mollusca melakukannya secara seksual. Secara keseluruhan tubuh Mollusca terdiri atas tiga struktur utama yaitu kaki, Massa Viseral, dan mantel. Jika dibagi menurut bentuk kaki, simetri tubuh, mantel, dan cangkangnya, Mollusca memiliki lima kelas di antaranya Pelecypoda, Scaphopoda, Gastropoda, Cephalopoda, dan Amphineura.',
                  'lib/images/mollusca.jpg',
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Echinodermata',
                  'Echinodermata merupakan sebutan bagi hewan yang memiliki kulit berduri. Sama seperti Mollusca, Echinodermata juga dilengkapi dengan lapisan tubuh triploblastik dan selomata (rongga sejati). Hewan-hewan yang masuk klasifikasi ini sejatinya hanya bisa ditemukan di lautan. Bintang laut, teripang, bulu babi, dan lili laut adalah contoh hewan Echinodermata. Ciri lain dari Echinodermata yaitu mempunyai sistem pencernaan yang lengkap, tidak memiliki sistem peredaran dara, melakukan reproduksi secara seksual, dan bergerak menggunakan kaki ambulakral. Total ada lima kelas Echinodermata yang dibedakan berdasarkan struktur tubuhnya. Kelas yang dimaksud adalah Crinoidea, Holothuroidea, Ophiuroidea, Echinoidea, dan Asteroidea.',
                  'lib/images/echinodermata.jpg',
                ),
                const SizedBox(height: 30),
                invertebrataCategory(
                  'Arthropoda',
                  'Arthropoda adalah nama lain dari hewan yang memiliki kaki beruas dan tubuhnya disusun atas triploblastik selomata. Selain itu, tubuh Arthropoda dilindungi oleh eksoskeleton atau rangka luar yang mengandung senyawa kimia kitin. Bicara mengenai struktur tubuhnya, Arthropoda terdiri atas kepala, dada, dan perut. Sementara itu, Arthropoda memiliki alat pernapasan yang bervariasi. Ada Arthropoda yang menggunakan trakea, paru-paru buku, bahkan insang. Di waktu tertentu Arthropoda akan mengalami proses ekdisis atau pergantian kulit. Berdasarkan struktur tubuhnya Arthropoda digolongkan lagi menjadi empat kelas yaitu Insecta, Crustacea, Myriapoda, dan Arachnida.',
                  'lib/images/arthropoda.jpg',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget untuk setiap kategori invertebrata
  Widget invertebrataCategory(
      String title, String description, String imageUrl) {
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
