// ignore_for_file: must_be_immutable, file_names
import 'package:flutter/material.dart';
import 'package:gpa/HomeScreen.dart';
import 'package:gpa/services/save.dart';
import 'constant.dart';

class LoadingScreen extends StatelessWidget {
  static const String id = "/load";
  BuildContext context;
  LoadingScreen(this.context, {super.key}) {
    next(context);
  }
  void next(BuildContext context) async {
    await SaveService.retrieveLang();
    if (lang == "en" || lang == "ar") {
      await Future.delayed(const Duration(seconds: 2), () {
        return Navigator.popAndPushNamed(context, HomeScreen.id);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[900],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset("assets/icon/icon2.png"),
                ),
              ),
            ),
            FutureBuilder(
                future: SaveService.retrieveLang(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  return lang != "en" && lang != "ar"
                      ? Row(
                          mainAxisAlignment: lang == ""
                              ? MainAxisAlignment.spaceAround
                              : MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    lang = "ar";
                                    SaveService.saveLang();
                                    Navigator.popAndPushNamed(
                                        context, HomeScreen.id);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      elevation: 20,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  child: const Text(
                                    "عربي",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  )),
                            ),
                            SizedBox(
                              height: 100,
                              width: 150,
                              child: ElevatedButton(
                                  onPressed: () {
                                    lang = "en";
                                    SaveService.saveLang();
                                    Navigator.popAndPushNamed(
                                        context, HomeScreen.id);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.black,
                                      elevation: 20,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)))),
                                  child: const Text(
                                    "English",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25),
                                  )),
                            ),
                          ],
                        )
                      : Directionality(
                          textDirection: lang == "ar"
                              ? TextDirection.rtl
                              : TextDirection.ltr,
                          child: Text(
                            lang == "ar" ? "مرحبا..." : "Welcome...",
                            style: const TextStyle(
                                fontSize: 25, color: Colors.white),
                          ),
                        );
                })
          ],
        ),
      ),
    );
  }
}
