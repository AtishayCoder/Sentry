import 'package:flutter/material.dart';

class CustomContainer extends StatefulWidget {
  const CustomContainer(
      {super.key,
      required this.name,
      required this.icon,
      required this.ondoubletap,
      required this.onlongclick,
      required this.onswiperight,
      required this.ontap});

  final String name;
  final IconData icon;
  final Function() ondoubletap; // Lock door
  final Function() onlongclick; // Status
  final Function() onswiperight; // Unlock door
  final Function() ontap; // Actions

  @override
  State<CustomContainer> createState() => _CustomContainerState();
}

class _CustomContainerState extends State<CustomContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: widget.ontap,
        onDoubleTap: widget.ondoubletap,
        onPanUpdate: (details) {
          if (details.delta.dx > 0) {
            widget.onswiperight;
          }
        },
        onLongPress: widget.onlongclick,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.lightBlueAccent,
          ),
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          width: double.infinity,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  color: Colors.white,
                  size: 30.0,
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  widget.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                    fontSize: 20.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
