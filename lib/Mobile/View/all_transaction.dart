import 'package:flutter/material.dart';
import 'package:marlo_task/Mobile/Controller/home_controller.dart';
import 'package:provider/provider.dart';

class AllTransaction extends StatelessWidget {
  const AllTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.download,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        padding: const EdgeInsets.only(left: 16),
                        child: TextFormField(
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            hintText: 'Search vessel',
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                            ),
                            border: InputBorder.none,
                          ),
                          keyboardType: TextInputType.name,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          enableDrag: false,
                          // isDismissible: false,
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,

                          builder: (context) {
                            return const CustomBottomSheet();
                          },
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Icon(
                          Icons.filter_alt_sharp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
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

class CustomBottomSheet extends StatelessWidget {
  const CustomBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
    return DraggableScrollableSheet(
      maxChildSize: 0.9,
      minChildSize: 0.5,
      initialChildSize: 0.8,
      builder: (context, scrollController) => Container(
        padding: const EdgeInsets.all(16.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: ListView(
          controller: scrollController,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                height: 10,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Filter",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    letterSpacing: 1,
                  ),
                ),
                TextButton(onPressed: () {}, child: const Text("Clear"))
              ],
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Money in and out.2",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        // letterSpacing: 1,
                      ),
                    ),
                    Consumer<HomeController>(
                      builder: (context, value, _) {
                        return Wrap(
                          children: [
                            FIlterSubTitles(
                              controller: controller,
                              items: "Money in",
                              isTrue: controller.isMoneyIn,
                              onTap: () {
                                controller.isTrue("Money in");
                                controller.isSelect(
                                  "Money in",
                                );
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Money Out",
                              isTrue: controller.isMoneyOut,
                              onTap: () {
                                controller.isTrue("Money Out");
                                controller.isSelect("Money out");
                              },
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Status.3",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        // letterSpacing: 1,
                      ),
                    ),
                    Consumer<HomeController>(
                      builder: (context, value, _) {
                        return Wrap(
                          children: [
                            FIlterSubTitles(
                              controller: controller,
                              items: "Completed",
                              isTrue: controller.isComplete,
                              onTap: () {
                                controller.isStatus("Completed");
                                controller.isSelectStatus("Completed");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Failed",
                              isTrue: controller.isFailed,
                              onTap: () {
                                controller.isStatus("Failed");
                                controller.isSelectStatus("Failed");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Declined",
                              isTrue: controller.isDeclined,
                              onTap: () {
                                controller.isStatus("Declined");
                                controller.isSelectStatus("Declined");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Pending",
                              isTrue: controller.isPending,
                              onTap: () {
                                controller.isStatus("Pending");
                                controller.isSelectStatus("Pending");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Reverted",
                              isTrue: controller.isReverted,
                              onTap: () {
                                controller.isStatus("Reverted");
                                controller.isSelectStatus("Reverted");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Cancelled",
                              isTrue: controller.isCancel,
                              onTap: () {
                                controller.isStatus("Cancel");
                                controller.isSelectStatus("Cancelled");
                              },
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ), Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Status.3",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        // letterSpacing: 1,
                      ),
                    ),
                    Consumer<HomeController>(
                      builder: (context, value, _) {
                        return Wrap(
                          children: [
                            FIlterSubTitles(
                              controller: controller,
                              items: "Completed",
                              isTrue: controller.isComplete,
                              onTap: () {
                                controller.isStatus("Completed");
                                controller.isSelectStatus("Completed");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Failed",
                              isTrue: controller.isFailed,
                              onTap: () {
                                controller.isStatus("Failed");
                                controller.isSelectStatus("Failed");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Declined",
                              isTrue: controller.isDeclined,
                              onTap: () {
                                controller.isStatus("Declined");
                                controller.isSelectStatus("Declined");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Pending",
                              isTrue: controller.isPending,
                              onTap: () {
                                controller.isStatus("Pending");
                                controller.isSelectStatus("Pending");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Reverted",
                              isTrue: controller.isReverted,
                              onTap: () {
                                controller.isStatus("Reverted");
                                controller.isSelectStatus("Reverted");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Cancelled",
                              isTrue: controller.isCancel,
                              onTap: () {
                                controller.isStatus("Cancel");
                                controller.isSelectStatus("Cancelled");
                              },
                            ),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FIlterSubTitles extends StatelessWidget {
  const FIlterSubTitles({
    super.key,
    required this.controller,
    required this.items,
    required this.isTrue,
    required this.onTap,
  });

  final HomeController controller;
  final String items;
  final bool isTrue;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: isTrue == true
            ? const Color.fromARGB(255, 174, 200, 244)
            : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          items,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 15,
            color: isTrue == true
                ? const Color.fromARGB(255, 39, 66, 112)
                : Colors.grey,
            // letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
