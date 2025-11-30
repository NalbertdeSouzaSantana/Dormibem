import 'package:flutter/material.dart';

class OpenDrawerIcon extends StatelessWidget {
  final IconData icon;

  const OpenDrawerIcon({super.key, this.icon = Icons.menu});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) => IconButton(
        icon: Icon(icon),
        onPressed: () => Scaffold.of(ctx).openDrawer(),
      ),
    );
  }
}

class OpenEndDrawerIcon extends StatelessWidget {
  final IconData icon;

  const OpenEndDrawerIcon({super.key, this.icon = Icons.account_circle});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) => IconButton(
        icon: Icon(icon),
        onPressed: () => Scaffold.of(ctx).openEndDrawer(),
      ),
    );
  }
}