// ignore_for_file: non_constant_identifier_names, avoid_types_as_parameter_names, file_names
import 'package:flutter/material.dart';
import 'package:gpa/services/save.dart';

import 'constant.dart';

class AGpaScreen extends StatefulWidget {
  static String id = "/AGPA";
  const AGpaScreen({Key? key}) : super(key: key);

  @override
  State<AGpaScreen> createState() => _AGpaScreenState();
}

class _AGpaScreenState extends State<AGpaScreen> {
  double lastGPA = 0, nowGPA = 0, AGPA = 0;
  int allHours = 0, nowHours = 0, hoursSum = 0;
  TextEditingController ahours = TextEditingController();
  TextEditingController nhours = TextEditingController();
  TextEditingController lGPA = TextEditingController();
  TextEditingController nGPA = TextEditingController();
  void cal() {
    hoursSum = 0;
    lastGPA = lGPA.text.isEmpty ? 0 : double.parse(lGPA.text);
    nowGPA = nGPA.text.isEmpty ? 0 : double.parse(nGPA.text);
    allHours = ahours.text.isEmpty ? 0 : int.parse(ahours.text);
    nowHours = nhours.text.isEmpty ? 0 : int.parse(nhours.text);
    hoursSum = allHours + nowHours;
    AGPA = hoursSum == 0
        ? 0
        : ((lastGPA * allHours) + (nowGPA * nowHours)) / hoursSum;
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
          title: Text(lang == "ar" ? "المعدل التراكمي" : "AGPA",
              style: const TextStyle(fontSize: 30))),
      body: Directionality(
        textDirection: lang == "ar" ? TextDirection.rtl : TextDirection.ltr,
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Text(lang == "ar" ? "معدلك التراكمي :" : "Your AGPA :",
                  style: const TextStyle(
                      fontSize: 45, fontWeight: FontWeight.bold)),
              Text(AGPA.toStringAsFixed(2),
                  style: TextStyle(
                      fontSize: 60,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900])),
              Divider(
                color: Colors.red[900],
                height: 20,
                thickness: 3,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                  lang == "ar" ? "المعدل التراكمي السابق :" : "The last AGPA :",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextFormField(
                      onChanged: (ValueKey) {
                        setState(() {
                          cal();
                        });
                      },
                      controller: lGPA,
                      maxLength: 5,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.red[900]),
                        labelText: lang == "ar" ? "المعدل التراكمي" : "AGPA",
                        hintText:
                            lang == "ar" ? "ادخل المعدل" : "Enter your AGPA",
                        prefixIcon: const Icon(
                          Icons.format_list_numbered_sharp,
                          color: Colors.black,
                        ),
                        fillColor: Colors.red[900],
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 185, 33, 22),
                                width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
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
                    child: TextFormField(
                      onChanged: (ValueKey) {
                        setState(() {
                          cal();
                        });
                      },
                      controller: ahours,
                      maxLength: 5,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.red[900]),
                        labelText: lang == "ar" ? "الساعات التركمية" : "Hours",
                        hintText: lang == "ar"
                            ? "ادخل عدد الساعات"
                            : "Enter Your all Hours",
                        prefixIcon: const Icon(
                          Icons.timer_sharp,
                          color: Colors.black,
                        ),
                        fillColor: Colors.red[900],
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 185, 33, 22),
                                width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  )),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Divider(
                color: Colors.red[900],
                height: 20,
                thickness: 3,
                indent: 30,
                endIndent: 30,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(lang == "ar" ? "المعدل الفصلي الحالي :" : "The New GPA :",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.all(0),
                    child: TextFormField(
                      onChanged: (ValueKey) {
                        setState(() {
                          cal();
                        });
                      },
                      controller: nGPA,
                      maxLength: 5,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.red[900]),
                        labelText: lang == "ar" ? "المعدل" : "GPA",
                        hintText:
                            lang == "ar" ? "ادخل المعدل" : "Enter your new GPA",
                        prefixIcon: const Icon(
                          Icons.format_list_numbered_sharp,
                          color: Colors.black,
                        ),
                        fillColor: Colors.red[900],
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 185, 33, 22),
                                width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
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
                    child: TextFormField(
                      onChanged: (ValueKey) {
                        setState(() {
                          cal();
                        });
                      },
                      controller: nhours,
                      maxLength: 5,
                      decoration: InputDecoration(
                        labelStyle: TextStyle(color: Colors.red[900]),
                        labelText: lang == "ar" ? "الساعات" : "Hours",
                        hintText: lang == "ar"
                            ? "ادخل عدد الساعات"
                            : "Enter the Hours",
                        prefixIcon: const Icon(
                          Icons.timer_sharp,
                          color: Colors.black,
                        ),
                        fillColor: Colors.red[900],
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Color.fromARGB(255, 185, 33, 22),
                                width: 2),
                            borderRadius: BorderRadius.circular(25)),
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Colors.black, width: 2),
                            borderRadius: BorderRadius.circular(25)),
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  )),
                ],
              ),
              Divider(
                color: Colors.red[900],
                height: 20,
                thickness: 3,
                indent: 30,
                endIndent: 30,
              ),
              Text(
                lang == "ar" ? "قريبا..." : "Coming Soon...",
                style: TextStyle(
                    color: Colors.red[900],
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              )
            ],
          ),
        ),
      ),
    );
  }
}
