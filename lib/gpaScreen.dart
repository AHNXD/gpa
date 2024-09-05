// ignore_for_file: file_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:gpa/services/save.dart';

import 'constant.dart';

class GpaScreen extends StatefulWidget {
  static String id = "/GPA";
  const GpaScreen({Key? key}) : super(key: key);

  @override
  State<GpaScreen> createState() => _GpaScreenState();
}

class _GpaScreenState extends State<GpaScreen> with WidgetsBindingObserver {
  int num = 1;
  List<double> hour = [0];
  List<double> point = [0];
  List<TextEditingController> marks = [TextEditingController()];
  double sum = 0;
  double hours = 0;
  double GPA = 0;
  void cal() {
    sum = 0;
    hours = 0;
    for (int i = 0; i < num; i++) {
      point[i] = marks[i].text.isEmpty ? 0 : double.parse(marks[i].text);
      sum += point[i] * hour[i];
      hours += hour[i];
    }
    GPA = hours == 0 ? 0 : sum / hours;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            actions: [
              TextButton(
                  onPressed: () {
                    lang = lang == "ar" ? "en" : "ar";
                    SaveService.saveLang();
                    setState(() {});
                  },
                  child: Text(
                    lang == "ar" ? "ع" : "E",
                    style: const TextStyle(color: Colors.white),
                  ))
            ],
            backgroundColor: Colors.red[900],
            centerTitle: true,
            title: Text(lang == "ar" ? "المعدل" : "GPA",
                style: const TextStyle(
                    fontSize: 30, fontWeight: FontWeight.bold))),
        body: Directionality(
          textDirection: lang == "ar" ? TextDirection.rtl : TextDirection.ltr,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: num,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(lang == "ar" ? "العلامة" : "Mark ",
                                style: const TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold)),
                            Text("${index + 1}",
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red[900])),
                            const Text(" :",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.all(0),
                              child: TextFormField(
                                controller: marks[index],
                                maxLength: 5,
                                decoration: InputDecoration(
                                  labelStyle: TextStyle(color: Colors.red[900]),
                                  labelText: lang == "ar" ? "النقاط" : "Points",
                                  hintText: lang == "ar"
                                      ? "ادخل النقاط"
                                      : "Enter the Points",
                                  prefixIcon: const Icon(
                                    Icons.format_list_numbered_sharp,
                                    color: Colors.black,
                                  ),
                                  fillColor: Colors.red[900],
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color:
                                              Color.fromARGB(255, 185, 33, 22),
                                          width: 2),
                                      borderRadius: BorderRadius.circular(25)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Colors.black, width: 2),
                                      borderRadius: BorderRadius.circular(25)),
                                ),
                                keyboardType: TextInputType.number,
                              ),
                            )),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                                child: Padding(
                                    padding: const EdgeInsets.all(0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                                lang == "ar"
                                                    ? "الساعات : "
                                                    : "Hours : ",
                                                style: const TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            Text(
                                              "${hour[index].toInt()}",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.red[900]),
                                            )
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (hour[index] != 0) {
                                                      hour[index]--;
                                                    }
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black,
                                                    elevation: 20,
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)))),
                                                child: const Icon(
                                                    Icons.arrow_left),
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(5),
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    if (hour[index] != 5) {
                                                      hour[index]++;
                                                    }
                                                  });
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.black,
                                                    elevation: 20,
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    20)))),
                                                child: const Icon(
                                                    Icons.arrow_right),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ))),
                          ],
                        ),
                        Divider(
                          color: Colors.red[900],
                          height: 20,
                          thickness: 2,
                          indent: 10,
                          endIndent: 10,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.black,
            child: const Icon(Icons.calculate_rounded),
            onPressed: () {
              setState(() {
                for (int i = 0; i < num; i++) {
                  point[i] =
                      marks[i].text.isEmpty ? 0 : double.parse(marks[i].text);
                  sum += point[i] * hour[i];
                  hours += hour[i];
                }
                GPA = hours == 0 ? 0 : sum / hours;
              });
              showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                        title: Text(
                          lang == "ar" ? "المعدل الحالي :" : "Your GPA:",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 35),
                        ),
                        content: Text(
                          GPA.toStringAsFixed(2),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              sum = 0;
                              hours = 0;
                              GPA = 0;
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "^_^ - AHN",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                backgroundColor: Colors.red[900],
                                duration: const Duration(seconds: 1),
                              ));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: const EdgeInsets.all(20),
                                elevation: 20,
                                shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)))),
                            child: Text(lang == "ar" ? "تم" : "done"),
                          )
                        ],
                        backgroundColor: Colors.red[900],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ));
            }),
        bottomNavigationBar: BottomAppBar(
          color: Colors.red[900],
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 56,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        if (num == 0) {
                          num = 0;
                        } else {
                          num--;
                          hour.removeLast();
                          point.removeLast();
                          marks.removeLast();
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    child: const Icon(
                      Icons.remove,
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        num++;
                        hour.add(0);
                        point.add(0);
                        marks.add(TextEditingController());
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        elevation: 20,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    child: const Icon(
                      Icons.add,
                      size: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
