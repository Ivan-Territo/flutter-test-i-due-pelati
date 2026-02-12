import 'package:flutter/material.dart';
import '../utils/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Responsive.isMobile(context) ? 250 : 350,
      padding: const EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(
        vertical: 0,
        horizontal: Responsive.isMobile(context) ? 16 : 50,
      ),
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
                    fontSize: Responsive.isMobile(context) ? 24 : 45,
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
          if (!Responsive.isMobile(context))
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
