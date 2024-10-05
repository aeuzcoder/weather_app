import 'package:flutter/material.dart';

class ContainerIcons extends StatelessWidget {
  const ContainerIcons({
    super.key,
    required this.id,
    required this.title,
    required this.time,
  });
  final int id;
  final String title;
  final String time;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width / 2.5;
    final height = MediaQuery.of(context).size.width / 5;
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          Image.asset('assets/$id.png'),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              Text(
                time,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
