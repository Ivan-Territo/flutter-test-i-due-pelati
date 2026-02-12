import 'package:flutter/material.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(20),
      color: const Color.fromARGB(255, 0, 0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Text('Surf Board Shop', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
              Text('© 2026 Surf Board Shop. All rights reserved.', style: TextStyle(color: Colors.white, fontSize: 12))


            ]
          ),
          Row(
            children: [
              Icon(Icons.facebook, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.alternate_email, color: Colors.white),
              SizedBox(width: 10),
              Icon(Icons.camera_alt, color: Colors.white),
            ],
          )
        ],
        
      ),
      
    );
  
}
}