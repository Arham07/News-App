import 'package:flutter/material.dart';

appbar(
  BuildContext context,
) {
  return AppBar(
    leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios_outlined,
          color: Colors.white,
        )),
    title: Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        Text(
          'News',
          style: TextStyle(fontWeight: FontWeight.w600),
        ),
        Text(
          'tify',
          style: TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
        )
      ],
    ),
    centerTitle: true,
    actions: const [
      Opacity(
        opacity: 0,
        child: Icon(
          Icons.abc_outlined,
          color: Colors.black,
          size: 60,
        ),
      )
    ],
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

//
// appBar: AppBar(
// title: Row(
// mainAxisSize: MainAxisSize.min,
// children: const <Widget>[
// Text(
// 'News',
// style: TextStyle(fontWeight: FontWeight.w600),
// ),
// Text(
// 'tify',
// style:
// TextStyle(color: Colors.white70, fontWeight: FontWeight.w600),
// )
// ],
// ),
// backgroundColor: Colors.transparent,
// centerTitle: true,
// elevation: 0.0,
// ),
