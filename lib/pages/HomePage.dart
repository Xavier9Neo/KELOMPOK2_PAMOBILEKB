import 'package:flutter/material.dart';
import 'package:pa_mobile/pages/ProfilePage.dart';
import 'package:pa_mobile/pages/Scan.dart';
import 'package:pa_mobile/pages/Settings.dart';
import 'package:pa_mobile/pages/invertebrata_screen.dart';
import 'package:pa_mobile/pages/vertebrata_screen.dart';
import 'package:provider/provider.dart';
import 'package:pa_mobile/provider/ThemeProvider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    const MyHomePageContent(),
    const MyScanPage(),
    const MySettingPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      backgroundColor: themeProvider.isDarkMode
          ? const Color.fromRGBO(122, 105, 97, 1.0)
          : const Color.fromRGBO(240, 234, 212, 1.0),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: themeProvider.isDarkMode
            ? const Color.fromRGBO(146, 57, 51, 1.0)
            : const Color.fromRGBO(212, 123, 39, 1.0),
        title: const Text("AnimalEdu"),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            iconSize: 40.0,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyProfilePage(),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: themeProvider.isDarkMode
            ? const Color.fromRGBO(207, 118, 76, 1.0)
            : const Color.fromRGBO(76, 174, 137, 1.0),
        selectedItemColor: const Color.fromRGBO(5, 41, 12, 1),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

class MyHomePageContent extends StatelessWidget {
  const MyHomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 10),
          _buildCategoriesSection(context),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Align(
              alignment: Alignment.centerLeft,
              child: const Text(
                "Facts",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          _buildFactsGrid(context),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildCategoriesSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Categories",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            "Berdasarkan tulang belakang yang dimilikinya, Kingdom Animalia terbagi atas dua macam yaitu invertebrata dan vertebrata. Klik gambar untuk informasi lebih lengkap.",
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildCategoryBox(
                    context,
                    "Vertebrata",
                    "lib/images/vertebrata.jpg",
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _buildCategoryBox(
                    context,
                    "Invertebrata",
                    "lib/images/invertebrata.jpg",
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFactsGrid(BuildContext context) {
    final facts = [
      {
        "title": "Hiu",
        "image": "lib/images/hiu.jpg",
        "description":
            "Hiu adalah ikan predator yang memiliki indra penciuman yang sangat tajam dan dapat mendeteksi darah dalam air hingga jarak satu mil."
      },
      {
        "title": "Bebek",
        "image": "lib/images/bebek.jpg",
        "description": "Bulu bebek tidak pernah basah karena memiliki kelenjar minyak khusus."
      },
      {
        "title": "Kucing",
        "image": "lib/images/kucing.jpg",
        "description":
            "Kucing memiliki lebih dari 20 otot di setiap telinga, yang memungkinkan mereka untuk memutar telinga 180 derajat."
      },
      {
        "title": "Semut",
        "image": "lib/images/semut.jpg",
        "description":
            "Ratu semut yang sudah kawin memiliki sistem kekebalan tubuh yang lebih baik sehingga bisa hidup lebih lama."
      },
      {
        "title": "Kupu-Kupu",
        "image": "lib/images/kupu.jpg",
        "description":
            "Kupu-kupu memiliki sensor rasa di kaki mereka, yang memungkinkan mereka merasakan makanan hanya dengan berdiri di atasnya."
      },
      {
        "title": "Bunglon",
        "image": "lib/images/bunglon.jpg",
        "description": "Mata bunglon bisa melihat 360 derajat."
      },
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
          childAspectRatio: 0.6, // Menyesuaikan tinggi box Facts
        ),
        itemCount: facts.length,
        itemBuilder: (context, index) {
          final fact = facts[index];
          return _buildFactCard(
              context, fact["title"]!, fact["image"]!, fact["description"]!);
        },
      ),
    );
  }

Widget _buildFactCard(BuildContext context, String title, String imagePath,
      String description) {
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromRGBO(229, 190, 95, 1.0),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: const Color.fromRGBO(41, 32, 58, 1.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            child: Image.asset(
              imagePath,
              width: double.infinity,
              height: 150, // Meningkatkan tinggi gambar
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }


  Widget _buildCategoryBox(
      BuildContext context, String title, String imagePath) {
    return GestureDetector(
      onTap: () {
        if (title == "Vertebrata") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Vertebrata(),
            ),
          );
        } else if (title == "Invertebrata") {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const Invertebrata(),
            ),
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: const Color(0xFFF5F3FF),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              ),
              child: Image.asset(
                imagePath,
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
