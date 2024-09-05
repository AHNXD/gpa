// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:gpa/agpaScreen.dart';
import 'package:gpa/gpaScreen.dart';
import 'package:gpa/services/save.dart';

import 'constant.dart';

class HomeScreen extends StatefulWidget {
  static String id = "/home";
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: SizedBox(
            height: 130,
            child: Column(
              children: [
                Divider(
                  color: Colors.red[900],
                  thickness: 2,
                  indent: 30,
                  endIndent: 30,
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/icon/icon2.png",
                  ),
                )),
              ],
            ),
          ),
        ),
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
            title: const Text(
              "YPU",
              style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            )),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Image.asset("assets/images/ypu.png"),
                )),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 500,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.pushNamed(context, GpaScreen.id);
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.all(10),
                          elevation: 20,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      child: Text(
                        lang == "ar" ? "المعدل" : "GPA",
                        style: const TextStyle(fontSize: 40),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                SizedBox(
                  width: 500,
                  child: ElevatedButton(
                      onPressed: () async {
                        await Navigator.pushNamed(context, AGpaScreen.id);
                        setState(() {});
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red[900],
                          padding: const EdgeInsets.all(10),
                          elevation: 20,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)))),
                      child: Text(
                        lang == "ar" ? "المعدل التراكمي" : "AGPA",
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 40),
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
