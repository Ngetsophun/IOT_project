
import 'package:flutter/material.dart';



class Device extends StatelessWidget {
  final String name;
  final String svg;
  final Color color;
  final bool isActive;
  final Function(bool) onChanged;


  const Device({super.key,
    required this.name,
      required this.svg,
      required this.color,
      required this.onChanged, required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}