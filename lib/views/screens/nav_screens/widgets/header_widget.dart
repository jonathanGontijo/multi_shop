import 'package:flutter/material.dart';

class HeaderWidgets extends StatelessWidget {
  const HeaderWidgets({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.20,
      child: Stack(
        children: [
          Image.asset(
            'assets/icons/searchBanner.jpeg',
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 68,
            left: 48,
            child: SizedBox(
              width: 250,
              height: 50,
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter text',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                    color: Color(0xFF7F7F7F),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 16,
                  ),
                  prefixIcon: Image.asset(
                    'assets/icons/searc1.png',
                  ),
                  suffixIcon: Image.asset(
                    'assets/icons/cam.png',
                  ),
                  fillColor: Colors.grey.shade200,
                  filled: true,
                  focusColor: Colors.black,
                ),
              ),
            ),
          ),
          Positioned(
            top: 78,
            left: 311,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                overlayColor: MaterialStateProperty.all(
                  const Color(0x0c7f7f),
                ),
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/bell.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 354,
            top: 78,
            child: Material(
              type: MaterialType.transparency,
              child: InkWell(
                onTap: () {},
                child: Ink(
                  width: 31,
                  height: 31,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/icons/message.png',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
