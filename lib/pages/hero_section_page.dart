import 'package:flutter/material.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 50),
      decoration: BoxDecoration(color: const Color.fromARGB(255, 0, 111, 83)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          // Testo a sinistra
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Discover the board\nthat matches your style',
                  style: TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontFamily: 'Surfbars',
                  ),
                ),
                SizedBox(height: 10),

                ElevatedButton(onPressed: () {}, child: Text('GET STARTED')),
              ],
            ),
          ),

          const SizedBox(width: 10),

          // Immagine a destra
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: 200,
              height: 300,
              child: Image.asset(
                'assets/images/hero_section.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
