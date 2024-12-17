import 'package:flutter/material.dart';
import 'package:flutter_application_test/custom_text.dart';

class Sepha3 extends StatefulWidget {
  const Sepha3({super.key});

  @override
  State<Sepha3> createState() => _Sepha3State();
}

class _Sepha3State extends State<Sepha3> with SingleTickerProviderStateMixin {
  late final AnimationController animate;
  int _counter = 0;
  String text = "سبحان الله";

  @override
  void initState() {
    super.initState();
    animate = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    animate.dispose();
    super.dispose();
  }

  void changetext() {
    if (_counter <= 33) {
      text = "سبحان الله";
    } else if (_counter >= 34 && _counter <= 66) {
      text = "الحمد لله";
    } else if (_counter >= 67 && _counter <= 99) {
      text = "الله اكبر";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 20),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage("assets/image/Background sepha.png"))),
        child: Column(
          children: [
            Image.asset("assets/image/Logo.png"),
            CustomText(
              font: 40,
              text: "سَبِّحِ اسْمَ رَبِّكَ الأعلى",
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  _counter++;
                  changetext();
                  if (!animate.isAnimating && _counter <= 100) {
                    animate.repeat();
                  } else if (_counter >= 100) {
                    animate.stop();
                    _counter = 0;
                    text = "سبحان الله";
                  }
                });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  RotationTransition(
                      alignment: Alignment.center,
                      turns: animate,
                      child: Image.asset("assets/image/SebhaBody 1.png")),
                  Column(
                    children: [
                      CustomText(
                        font: 35,
                        text: text,
                        fontWeight: FontWeight.w900,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomText(
                        font: 40,
                        text: "$_counter",
                        fontWeight: FontWeight.w500,
                      )
                    ],
                  )
                ],
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
