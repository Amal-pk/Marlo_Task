import 'package:flutter/material.dart';
import 'package:marlo_task/Mobile/Controller/bottom_navigation_controller.dart';
import 'package:provider/provider.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BottomNavigationBarController>(context);
    int currentScreenIndex = controller.currentIndexSearch();
    return Scaffold(
      body: controller.screens[currentScreenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        // showSelectedLabels: false,
        elevation: 0,
        currentIndex: currentScreenIndex,
        onTap: (value) => controller.currentIndexResult(value),
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              (currentScreenIndex == 0)
                  ? Icons.home_filled
                  : Icons.home_outlined,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (currentScreenIndex == 1)
                  ? Icons.paid_sharp
                  : Icons.monetization_on_outlined,
            ),
            label: 'Loans',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (currentScreenIndex == 2)
                  ? Icons.contact_page
                  : Icons.contact_page_outlined,
            ),
            label: 'Contact',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (currentScreenIndex == 3) ? Icons.groups : Icons.groups_outlined,
            ),
            label: 'Team',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              (currentScreenIndex == 4) ? Icons.chat : Icons.chat_outlined,
            ),
            label: 'Chat',
          ),
        ],
      ),
    );
  }
}
