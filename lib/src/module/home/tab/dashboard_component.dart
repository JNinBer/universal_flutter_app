import 'package:cached_network_image/cached_network_image.dart';
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DashboardComponent extends ConsumerWidget {
  DashboardComponent({super.key});

  final List<Color> colors = [Colors.red, Colors.green, Colors.blue, Colors.yellow];
  final double radius = 100.0;

  final List<IconData> icons = [
    Icons.directions_walk,
    Icons.directions_bike,
    Icons.directions_car,
    Icons.directions_bus,
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 200.0,
            child: HorizontalBannerComponent(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 200,
              child: GestureDetector(
                onTap: () => ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text('1111111PP'))),
                child: const Card(
                  color: Colors.red,
                  margin: EdgeInsets.zero,
                  child: Center(
                    child: Text('Card 1'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalBannerComponent extends StatelessWidget {
  const HorizontalBannerComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> cardData = ['Card 1', 'Card 2', 'Card 3', 'Card 4', 'Card 5'];

    final scWidth = MediaQuery.sizeOf(context).width;

    const padding = EdgeInsets.only(left: 20, right: 20);

    final contentWidth = scWidth - padding.horizontal + 8;

    final viewportFraction = contentWidth / scWidth;

    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        itemCount: cardData.length,
        physics: const PageScrollPhysics(parent: ClampingScrollPhysics()),
        controller: PageController(viewportFraction: viewportFraction),
        itemBuilder: (BuildContext context, int index) {
          return const _BannerPageComponent();
        },
      ),
    );
  }
}

class _BannerPageComponent extends StatelessWidget {
  const _BannerPageComponent();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200.0,
      child: ListView.builder(
        itemCount: 3,
        primary: false,
        itemBuilder: (BuildContext context, int index) {
          return _ProductTile(
            imageUrl: 'https://picsum.photos/300/300?random=$index',
            title: 'Title',
            description: 'Description',
          );
        },
      ),
    );
  }
}

class _ProductTile extends StatelessWidget {
  const _ProductTile({this.imageUrl, this.title, this.description});
  final String? imageUrl;
  final String? title;
  final String? description;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(6.0),
            ),
            child: CachedNetworkImage(
              imageUrl: imageUrl ?? '',
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          12.hGap,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
                4.vGap,
                Text(
                  description ?? '',
                  style: const TextStyle(fontSize: 12),
                ),
              ],
            ),
          ),
          8.hGap,
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Colors.black54,
              tapTargetSize: MaterialTapTargetSize.padded,
              shape: const StadiumBorder(side: BorderSide(color: Colors.grey)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              minimumSize: Size.zero,
              fixedSize: const Size(50, 20),
              surfaceTintColor: Colors.transparent,
              textStyle: const TextStyle(
                fontSize: 14,
                height: 1.0,
              ),
            ),
            child: const Text(
              '安装',
              strutStyle: StrutStyle(fontSize: 14, height: 1.15, forceStrutHeight: true),
            ),
          )
        ],
      ),
    );
  }
}
