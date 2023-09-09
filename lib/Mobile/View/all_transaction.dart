import 'package:flutter/material.dart';
import 'package:marlo_task/Mobile/Controller/home_controller.dart';
import 'package:marlo_task/model/model.dart';
import 'package:provider/provider.dart';

class AllTransaction extends StatelessWidget {
  const AllTransaction({super.key, required this.data});
  final List<TransactionModel> data;
  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<HomeController>(context);
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
              Consumer<HomeController>(builder: (context, value, _) {
                return Visibility(
                  visible: controller.items.isNotEmpty,
                  replacement: const SizedBox(),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: controller.items.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 50,
                          margin: const EdgeInsets.all(10),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.blue[100],
                              borderRadius: BorderRadius.circular(10)),
                          child: FittedBox(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.items[index],
                                  style: const TextStyle(
                                      color: Colors.blue, fontSize: 15),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.isRemove(index);
                                    },
                                    icon: const Icon(Icons.close,
                                        color: Colors.blue))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }),
              Consumer<HomeController>(builder: (context, value, _) {
                return Visibility(
                  visible: data.isNotEmpty,
                  replacement: const Center(child: CircularProgressIndicator()),
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: data.length,
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
                          title: Text(data[index].status),
                          subtitle: Text(data[index]
                              .estimatedSettledAt
                              .toString()
                              .split("00")
                              .first),
                          trailing: Text(
                            "${data[index].currency} ${data[index].amount}",
                          ),
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
                    const Text(
                      "Money in and out.2",
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
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Time range",
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
                              items: "18 Jan-2 Feb",
                              isTrue: controller.isDate,
                              onTap: () {
                                controller.isTime("18 Jan-2 Feb");
                                controller.isSelectTime("18 Jan-2 Feb");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "Today",
                              isTrue: controller.isToday,
                              onTap: () {
                                controller.isTime("Today");
                                controller.isSelectTime("Today");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "This Week",
                              isTrue: controller.isWeek,
                              onTap: () {
                                controller.isTime("This Week");
                                controller.isSelectTime("This Week");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "This Month",
                              isTrue: controller.isMonth,
                              onTap: () {
                                controller.isTime("This Month");
                                controller.isSelectTime("This Month");
                              },
                            ),
                            FIlterSubTitles(
                              controller: controller,
                              items: "This quarter",
                              isTrue: controller.isQuarter,
                              onTap: () {
                                controller.isTime("This quarter");
                                controller.isSelectTime("This quarter");
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
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Amount",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      // letterSpacing: 1,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 150,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "0",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            // letterSpacing: 1,
                          ),
                        ),
                      ),
                      Container(
                        width: 150,
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "5000",
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                            // letterSpacing: 1,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 163, 206, 241),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.blue),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                controller.isApply();
                Navigator.pop(context);
              },
              child: Container(
                height: 50,
                width: double.infinity,
                alignment: Alignment.center,
                margin:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Apply",
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                      color: Colors.white),
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
