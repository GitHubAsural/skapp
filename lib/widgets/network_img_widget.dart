import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class NetworkImgWidget extends StatefulWidget {
  final imgUrl;
  final double radius;

  NetworkImgWidget({
    Key key,
    this.imgUrl,
    this.radius,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _NetworkImgWidgetState(imgUrl, radius);
  }
}

class _NetworkImgWidgetState extends State<NetworkImgWidget> {
  var imgUrl;
  final radius;
  _NetworkImgWidgetState(this.imgUrl, this.radius);

  @override
  Widget build(BuildContext context) {
    // precacheImage(CachedNetworkImageProvider(imgUrl), context,
    //     onError: (e, stackTrace) {
    //   print('Image failed to load with error $e.');
    //   setState(() {
    //     imageFailedToLoad = true;
    //   });
    // });

    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 14),
          child: Center(
            child: CircularProgressIndicator(
              strokeWidth: 1.4,
            ),
          ),
        ),
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(radius)),
          child: FadeInImage(
            fadeInDuration: Duration(milliseconds: 10),
            fadeOutDuration: Duration(milliseconds: 10),
            placeholder: MemoryImage(kTransparentImage),
            image: CachedNetworkImageProvider(
              imgUrl,
            ),
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),
        ),
      ],
    );
  }
}
