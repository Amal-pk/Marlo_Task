import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:marlo_task/Mobile/Controller/home_controller.dart';
import 'package:marlo_task/Mobile/View/all_transaction.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final List<String> img1 = [
    "asset/download (1).png",
    "asset/download (2).png",
    "asset/download (3).png",
    "asset/download (4).png",
    "asset/download.jpeg",
    "asset/download.png",
  ];
  final List<String> countryName = [
    "Maxico",
    "Italy",
    "United Kingdom",
    "France",
    "United States",
    "Canada",
  ];
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
    final controller = Provider.of<HomeController>(context, listen: false);
    WidgetsBinding.instance.addPostFrameCallback(((timeStamp) {
      controller.init();
    }));
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
                  itemCount: 6,
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
                        children: [
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(img1[index]),
                          ),
                          const Padding(
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
                            countryName[index],
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
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
                          builder: (context) => AllTransaction(
                            data: controller.data,
                          ),
                        ),
                      );
                    },
                    child: const Text("See all"),
                  ),
                ],
              ),
              Consumer<HomeController>(builder: (context, value, _) {
                return Visibility(
                  visible: controller.data.isNotEmpty,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.indigo[900],
                                borderRadius: BorderRadius.circular(10)),
                            child: const Icon(
                              Icons.arrow_downward_outlined,
                              color: Colors.white,
                            ),
                          ),
                          title: Text(controller.data[index].status),
                          subtitle: Text(controller
                              .data[index].estimatedSettledAt
                              .toString()
                              .split("00")
                              .first),
                          trailing: Text(
                              "${controller.data[index].currency} ${controller.data[index].amount}"),
                        ),
                      );
                    },
                  ),
                );
              })
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
