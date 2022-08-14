import 'package:flutter/material.dart';
import 'package:todo_db_provider/Router/router.dart';
import 'package:todo_db_provider/views/screens/main_screen.dart';

class Onboarding extends StatelessWidget {
  String color = "0xff6035D0";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      home: onboarding(),
    );
  }
}

class onboarding extends StatefulWidget {
  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  int currentPage = 0;
  final PageController _pageController = PageController(
    initialPage: 0,
    keepPage:
        true, // Save the current [page] with [PageStorage] and restore it if this controller's scrollable is recreated.
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView(
                  controller: _pageController,
                  children: [
                    // Todo App
                    // Welcome to the best Todo App baby !

                    onBoardPage("welcome", "Hello !",
                        "Welcome to the best Todo App baby !"),
                    onBoardPage("manage", "Manage your task",
                        "Whats going to happen tomorrow?"),
                    onBoardPage("onboardingtwo", "Daily task",
                        "Let's make your all task easy."),
                    onBoardPage("onboardingthree", "Plan Your Day",
                        "Add A Task And The App Will Remind You."),
                  ],
                  onPageChanged: (value) {
                    setCurrentPage(value);
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(4, (index) => getIndicator(index)),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              height: 300,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/path1.png'),
                fit: BoxFit.fill,
              )),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: openLoginPage,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 100, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 20,
                              spreadRadius: 3,
                              offset: const Offset(0, 9),
                            )
                          ]),
                      child: const Text(
                        "GET STARTED",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 13,
            left: 153,
            child: Container(
              height: 4,
              width: 110,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(10.46),
              ),
            ),
          )
        ],
      ),
    );
  }

  AnimatedContainer getIndicator(int pageNo) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: 10,
      width: (currentPage == pageNo) ? 20 : 10,
      duration: const Duration(
        milliseconds: 100,
      ),
      decoration: BoxDecoration(
        color: (currentPage == pageNo) ? Colors.black : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  Column onBoardPage(String img, String title, String subtitle) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 20,
        ),
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(50),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/$img.png'),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          child: Text(
            subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  setCurrentPage(int value) {
    currentPage = value;
    setState(() {});
  }

  openLoginPage() {
    AppRouter.NavigateToWidget(MainTodoPage());
  }
}
