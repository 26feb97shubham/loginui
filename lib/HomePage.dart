import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:loginui/banners.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage(this.title, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _current = 0;
  final CarouselController _controller = CarouselController();

  String get title => this.title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        CarouselSlider(
          items: bannerSliders,
          carouselController: _controller,
          options: CarouselOptions(
              autoPlay: true,
              enlargeCenterPage: false,
              aspectRatio: 2.0,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          verticalDirection: VerticalDirection.down,
          children: bannersList.asMap().entries.map((entry) {
            return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                    width: 12,
                    height: 12,
                    margin:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: (Theme.of(context).brightness == Brightness.dark
                                ? Colors.white
                                : Colors.black)
                            .withOpacity(_current == entry.key ? 0.9 : 0.4))));
          }).toList(),
        ),
        Expanded(
            child: GridView.extent(
          padding: EdgeInsets.all(10),
          maxCrossAxisExtent: 200.0,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('First', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Second', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Third', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Four', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Fifth', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Six', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('First', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Second', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Third', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Four', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Fifth', style: TextStyle(fontSize: 20)),
                color: Colors.yellow,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                child: const Text('Six', style: TextStyle(fontSize: 20)),
                color: Colors.blue,
              ),
            )
          ],
        ))
      ]),
    );
  }

  final List<Widget> bannerSliders = bannersList
      .map((item) => Container(
            child: Container(
              transformAlignment: Alignment.topCenter,
              alignment: Alignment.topCenter,
              margin: EdgeInsets.all(5.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  child: Stack(
                    children: <Widget>[
                      Image.network(item.images,
                          fit: BoxFit.cover, width: 1000.0)
                    ],
                  )),
            ),
          ))
      .toList();
}
