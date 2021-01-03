//import 'package:doubanapp/widgets/image/cached_network_image.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

typedef OnTab = void Function();

class CacheImgRadius extends StatelessWidget {
  final String imgUrl;
  final double radius;
  final OnTab onTab;
  CacheImgRadius({Key key, @required this.imgUrl, this.radius, this.onTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: FadeIn(
            child: CachedNetworkImage(
              imageUrl: imgUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                  child: Shimmer.fromColors(
                baseColor: Colors.grey[200],
                highlightColor: Colors.white12,
                child: Container(
                  color: Colors.black38,
                ),
              )),
            ),
          )),
      // onTap: () {
      //   onTab();
      // },
    );
  }
}
