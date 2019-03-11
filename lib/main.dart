import 'package:flutter/material.dart';
import './thumbnail_card.dart';

void main() => runApp(ThumbnailCardExample());

class NebulaInfo {
  final String name;
  final String info;

  NebulaInfo(this.name, this.info);
}

var nebulaInfos = [
  NebulaInfo(
    'Carina Nebula',
    'Composed of gas and dust, the pictured pillar resides in a tempestuous stellar nursery called the Carina Nebula, located 7500 light-years away in the southern constellation of Carina. Taken in visible light, the image shows the tip of the three-light-year-long pillar, bathed in the glow of light from hot, massive stars off the top of the image.',
  ),
  NebulaInfo(
    'Triangulum Emission Garren Nebula',
    'This is a Hubble Space Telescope image (right) of a vast nebula called NGC 604, which lies in the neighboring spiral galaxy M33, located 2.7 million light-years away in the constellation Triangulum. This is a site where new stars are being born in a spiral arm of the galaxy. Though such nebulae are common in galaxies, this one is particularly large, nearly 1,500 light-years across.',
  ),
  NebulaInfo(
    'SNR B0509-67.5',
    'This delicate shell, photographed by the NASA/ESA Hubble Space Telescope, appears to float serenely in the depths of space, but this apparent calm hides an inner turmoil. The gaseous envelope formed as the expanding blast wave and ejected material from a supernova tore through the nearby interstellar medium.',
  ),
  NebulaInfo(
    'Crab Nebula',
    'This is a mosaic image, one of the largest ever taken by NASA\'s Hubble Space Telescope of the Crab Nebula, a six-light-year-wide expanding remnant of a star\'s supernova explosion. Japanese and Chinese astronomers recorded this violent event nearly 1,000 years ago in 1054, as did, almost certainly, Native Americans.',
  ),
  NebulaInfo(
    'Omega Nebula',
    'The photograph, taken by NASA\'s Hubble Space Telescope, captures a small region within M17, a hotbed of star formation. M17, also known as the Omega or Swan Nebula, is located about 5500 light-years away in the constellation Sagittarius. The wave-like patterns of gas have been sculpted and illuminated by a torrent of ultraviolet radiation from young, massive stars, which lie outside the picture to the upper left.',
  ),
];

class ImageView extends StatelessWidget {
  final int nebulaIndex;

  ImageView(this.nebulaIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nebulaInfos[nebulaIndex].name),
      ),
      body: Hero(
        tag: '$nebulaIndex.jpg',
        child: Image.asset('assets/$nebulaIndex.jpg'),
      ),
    );
  }
}

class ThumbnailCardExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Thumbnail Card Example'),
        ),
        body: ListView.builder(
          itemCount: 5,
          itemBuilder: (buildContext, index) {
            return InkWell(
              onTap: () {
                Navigator.of(buildContext).push(
                  MaterialPageRoute(
                    builder: (context) => ImageView(index),
                  ),
                );
              },
              child: Container(
                padding: EdgeInsets.fromLTRB(4, 4, 4, 0),
                child: ThumbnailCard(
                  thumbnailHeroTag: '$index.jpg',
                  thumbnail: Image.asset('assets/$index.jpg'),
                  thumbnailWidth: 80,
                  content: ListTile(
                    contentPadding: EdgeInsets.fromLTRB(10, 0, 10, 10),
                    title: Text(nebulaInfos[index].name),
                    subtitle: Text(nebulaInfos[index].info),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
