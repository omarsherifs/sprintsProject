import 'package:flutter/material.dart';

class AppMainPageView extends StatefulWidget {
  const AppMainPageView({super.key, required this.body, required this.pageTitle});
  final Widget body;
  final String pageTitle;
  @override
  State<AppMainPageView> createState() => _AppMainPageViewState();
}

class _AppMainPageViewState extends State<AppMainPageView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.pageTitle)),
      body: widget.body,
    );
  }
}
