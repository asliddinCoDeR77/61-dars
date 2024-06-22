import 'package:flutter/material.dart';
import 'package:scrollable_app/widgets/sliver_delegate.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color color = Colors.grey;
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
              title: Text(
                "Sliver App Bar",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow,
                ),
              ),
              background: Image.network(
                "https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19719.jpg",
              ),
            ),
            expandedHeight: 203,
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverHeaderDelegate(
              child: Container(
                color: Colors.white,
                child: Text(
                  "Popular",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              minHeight: 50,
              maxHeight: 50,
            ),
          ),
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Image.network(
                        "https://img.freepik.com/free-photo/young-handsome-man-choosing-clothes-shop_1303-19719.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("\$499.99"),
                        IconButton(
                          onPressed: () {
                            if (color == Colors.grey) {
                              color = Colors.red;
                            } else {
                              color = Colors.grey;
                            }
                            setState(() {});
                          },
                          icon: Icon(
                            size: 20,
                            Icons.favorite,
                            color: color,
                          ),
                        ),
                      ],
                    ),
                    Text("Pull and Bear clothes"),
                  ],
                );
              },
              childCount: 10,
            ),
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 0.714,
            ),
          ),
          SliverPersistentHeader(
              pinned: true,
              delegate: SliverHeaderDelegate(
                child: Container(
                  color: Colors.white,
                  child: Text(
                    "Man's fashion",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                minHeight: 50,
                maxHeight: 50,
              )),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Column(
                  children: [
                    Container(
                      width: 360,
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
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                );
              },
              childCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}
