import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:sprintsapp/views/login_view.dart';

class CustomeWidgetsView extends StatefulWidget {
  const CustomeWidgetsView({super.key});

  @override
  State<CustomeWidgetsView> createState() => _CustomeWidgetsViewState();
}

class _CustomeWidgetsViewState extends State<CustomeWidgetsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Widgets")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: MyCustomButton(
              label: "hello",
              onTap: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute<void>(builder: (context) => const LoginScreen()));
              },
            ),
          ),
          Center(
            child: MyCustomButton(
              label: "bye",
              iconData: Icons.abc_rounded,
            ).animate(onPlay: (controller) => controller.repeat(reverse: true)).fade(),
          ),
        ],
      ),
    );
  }
}

class MyCustomButton extends StatelessWidget {
  const MyCustomButton({super.key, required this.label, this.iconData, this.onTap});
  final String label;
  final IconData? iconData;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.circular(30),
        ),
        width: 200,
        height: 45,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (iconData != null) ...[Icon(iconData), const SizedBox(width: 5)],
              Text(label, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
