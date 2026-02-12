import 'package:flutter/material.dart';

class NavigationBarCustom extends StatelessWidget {
  const NavigationBarCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(vertical: 0, horizontal: 50.0),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 111, 83)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'SurfBoardShop',
            style: TextStyle(
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 20,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Example action for the button
              print('Button pressed');
            },
            child: Text('Contact Us'),
          ),
        ],
      ),
    );
  }
}
