import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marlo_task/Mobile/View/all_transaction.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<String> img = [
    'asset/Group 1000001639.svg',
    'asset/Group 1000001685.svg',
    'asset/Group 1000001638.svg',
    "asset/Group 1000001637.svg",
  ];
  final List<String> txt = [
    'Verify your business documents',
    'Verify your identity',
    'Open a Marlo business account',
    "Get prequalified",
  ];
  final List<Color> clr1 = [
    const Color.fromARGB(255, 251, 251, 251),
    const Color.fromARGB(255, 251, 251, 251),
    const Color.fromARGB(255, 251, 251, 251),
    const Color.fromARGB(255, 251, 251, 251),
  ];
  final List<Color> clr2 = [
    const Color.fromARGB(255, 225, 192, 237).withOpacity(0.8),
    const Color.fromARGB(255, 239, 227, 192).withOpacity(0.8),
    const Color.fromARGB(255, 208, 243, 210).withOpacity(0.8),
    const Color.fromARGB(255, 203, 221, 236).withOpacity(0.8),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Container(
          margin: const EdgeInsets.all(5),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.amber,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            "JB",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 200,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2,
                            ),
                          ]),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          CircleAvatar(
                            radius: 30,
                            backgroundColor: Colors.amber,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "1223568484656164",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            "Country Name",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              const Text(
                "To Do .4",
                style: TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 150,
                child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return CustomContainer(
                      clr1: clr1[index],
                      clr2: clr2[index],
                      img: img[index],
                      title: txt[index],
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "All transaction",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AllTransaction(),
                        ),
                      );
                    },
                    child: const Text("See all"),
                  ),
                ],
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Card(
                    child: ListTile(
                      leading: CircleAvatar(),
                      title: Text("Rent"),
                      subtitle: Text("3014025"),
                      trailing: Text("5646"),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
    required this.clr1,
    required this.clr2,
    required this.img,
    required this.title,
  });
  final Color clr1;
  final Color clr2;
  final String img;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      width: 150,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [clr1, clr2],
          end: Alignment.bottomCenter,
          begin: Alignment.topCenter,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(img),
          Text(
            title,
            maxLines: 3,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
