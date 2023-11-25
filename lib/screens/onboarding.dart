import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:haircut/screens/login.dart';
import 'package:lottie/lottie.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Onboardingsc extends StatefulWidget {
  const Onboardingsc({super.key});

  @override
  State<Onboardingsc> createState() => _OnboardingscState();
}

class _OnboardingscState extends State<Onboardingsc> {
  PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            children: [
              Container(
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LottieBuilder.network(
                        "https://lottie.host/8cd04b84-2625-4ffe-a6d2-ded58c936d92/emJPGXZbwr.json"),
                    const Padding(
                      padding: EdgeInsets.all(7.0),
                      child: Text(
                        "Search your favorite movies at one place",
                        style: TextStyle(
                          color: Color.fromARGB(255, 0, 0, 0),
                          fontWeight: FontWeight.bold,
                          fontSize: 26,
                        ),
                      ),
                    )
                  ],
                )),
              ),
              Container(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      LottieBuilder.network(
                        "https://lottie.host/59a06738-db55-4a4f-b9ec-bea2569ff0e0/0YCH0ipY4u.json",
                        repeat: true,
                        reverse: true,
                      ),
                      const Text(
                        "Watch all you favorite movies at high quality",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Container(
              alignment: const Alignment(0, 0.5),
              child: SmoothPageIndicator(controller: _controller, count: 2)),
          Container(
            alignment: const Alignment(0, 0.7),
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const Loginp());
              },
              child: const Text("Get Started"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                onPrimary: Colors.white,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                fixedSize: const Size(260, 60),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
