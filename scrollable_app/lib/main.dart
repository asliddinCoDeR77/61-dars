import 'package:flutter/material.dart';
import 'package:scrollable_app/screens/views/splash_screen.dart';
import 'package:scrollable_app/widgets/sliver_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: SplashScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Use a Set to manage the liked items by their index
  final Set<int> _likedItems = {};

  // List of image URLs for the grid items
  final List<String> _imageUrls = [
    "https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19719.jpg",
    "https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19722.jpg",
    "https://hips.hearstapps.com/hmg-prod/images/index-bomber-65a839208f31a.jpg?resize=2048:*",
    "https://i.shgcdn.com/5e86ceac-b4d5-46c7-922a-c50aa7b13b68/-/format/auto/-/preview/3000x3000/-/quality/lighter/",
    "https://img.freepik.com/free-photo/smiling-bearded-man-choosing-new-clothes_1303-17838.jpg",
    "https://img.freepik.com/free-photo/portrait-happy-girl-with-shopping-bags_1157-12652.jpg",
    "https://img.freepik.com/free-photo/couple-carrying-shopping-bags_1157-12002.jpg",
    "https://img.freepik.com/free-photo/smiling-man-showing-thumb-up-standing-near-rack-clothes_171337-8232.jpg",
    "https://img.freepik.com/free-photo/fashionable-young-woman-holding-shopping-bags_171337-8616.jpg",
    "https://img.freepik.com/free-photo/close-up-woman-choosing-clothes-shop_171337-7714.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.amber,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              expandedTitleScale: 2,
              title: const Text(
                "Sliver App Bar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              background: Image.network(
                "https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19719.jpg",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Icon(Icons.error),
                ),
              ),
            ),
            expandedHeight: 200,
          ),
          _buildSectionHeader("Popular"),
          _buildSliverGrid(),
          _buildSectionHeader("Men's Fashion"),
          _buildSliverList(),
        ],
      ),
    );
  }

  SliverPersistentHeader _buildSectionHeader(String title) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: SliverHeaderDelegate(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(8.0),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        minHeight: 50,
        maxHeight: 50,
      ),
    );
  }

  SliverGrid _buildSliverGrid() {
    return SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return _buildGridItem(index);
        },
        childCount: _imageUrls.length, // Use the length of the image list
      ),
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 400,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 0.714,
      ),
    );
  }

  Widget _buildGridItem(int index) {
    bool isLiked = _likedItems.contains(index);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            clipBehavior: Clip.hardEdge,
            child: Image.network(
              _imageUrls[index], // Fetch the image URL by index
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => const Center(
                child: Icon(Icons.error),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text("\$499.99"),
              IconButton(
                onPressed: () {
                  setState(() {
                    if (isLiked) {
                      _likedItems.remove(index);
                    } else {
                      _likedItems.add(index);
                    }
                  });
                },
                icon: Icon(
                  Icons.favorite,
                  color: isLiked ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
          const Text("Pull and Bear clothes"),
        ],
      ),
    );
  }

  SliverList _buildSliverList() {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8.0),
            child: Container(
              width: double.infinity,
              height: 110,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.black, Colors.grey],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                title: const Text(
                  'Men`s Fashion\nCollection',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                subtitle: const Text(
                  'Discount up to 60%',
                  style: TextStyle(color: Colors.white),
                ),
                trailing: Image.network(
                  'https://img.freepik.com/premium-vector/men-s-clothing-store-logo-clothing-store-transparent-background-clothing-shop-logo-vector_148524-756.jpg',
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
            ),
          );
        },
        childCount: 10,
      ),
    );
  }
}
