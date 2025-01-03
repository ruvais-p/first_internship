import 'package:flutter/material.dart';

class ListTitle extends StatelessWidget {
  ListTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_drop_down,
                color: Colors.black87,
                size: 30,
              ),
            ],
          ),
          const Divider(
            color: Colors.black,
            thickness: 2,
            indent: 9,
            endIndent: 9,
          )
        ],
      ),
    );
  }
}