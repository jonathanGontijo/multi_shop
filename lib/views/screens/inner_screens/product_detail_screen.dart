import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key, required this.productData});

  final dynamic productData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Product Detail',
              textAlign: TextAlign.center,
              style: GoogleFonts.lato(
                fontSize: 18,
                color: const Color(
                  0xFF363330,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            width: 260,
            height: 274,
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  left: 0,
                  top: 0,
                  child: Container(
                    width: 260,
                    height: 260,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFFD8DDFF,
                      ),
                      borderRadius: BorderRadius.circular(130),
                    ),
                  ),
                ),
                Positioned(
                  left: 22,
                  top: 0,
                  child: Container(
                    width: 216,
                    height: 274,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF9CA8FF,
                      ),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: SizedBox(
                      height: 300,
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: productData['productImage'].length,
                          itemBuilder: (context, index) {
                            return Image.network(
                              productData['productImage'][index],
                              width: 198,
                              height: 225,
                              fit: BoxFit.cover,
                            );
                          }),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
