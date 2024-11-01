import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:modal_progress_hud_alt/modal_progress_hud_alt.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sentry/components/custom_container.dart';

import '../components/esp_communicator.dart' as esp;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool controller = false;

  void showIndexes() {
    Alert(
      context: context,
      type: AlertType.info,
      title: "Actions",
      desc:
          "1) Swipe right to unlock door\n2) Double tap to lock door\n3) Long click to view status\n4)Tap to view this window again",
    ).show();
  }

  late List<ConnectivityResult> connectivityResult;

  @override
  Widget build(BuildContext context) {
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      controller = true;
      connectivityResult = await (Connectivity().checkConnectivity());
      controller = false;
      if (connectivityResult.contains(ConnectivityResult.none)) {
        Alert(
          context: context,
          title: "Network Issue",
          desc: "You are not connected to a WiFi network.",
          type: AlertType.error,
        ).show();
      } else {
        showIndexes();
      }
    });
    return ModalProgressHUD(
      inAsyncCall: controller,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(
              "S-entry control",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            backgroundColor: Colors.lightBlueAccent,
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomContainer(
                  name: "Front Door",
                  icon: Icons.door_sliding_outlined,
                  ontap: () => showIndexes(),
                  onswiperight: () async {
                    // Unlock door
                    controller = true;
                    print("Button pressed, sending data...");

                    var result = await esp.unlockFrontDoor();

                    if (result == "e") {
                      controller = false;
                      Alert(
                              type: AlertType.error,
                              context: context,
                              title: "Error",
                              desc:
                                  "There was an error in sending your data! Please try again.")
                          .show();
                    }
                    controller = false;
                  },
                  ondoubletap: () async {
                    // Lock door
                    controller = true;
                    print("Button pressed, sending data...");
                    var result = await esp.lockFrontDoor();

                    if (result == "e") {
                      controller = false;
                      Alert(
                              type: AlertType.error,
                              context: context,
                              title: "Error",
                              desc:
                                  "There was an error in sending your data! Please try again.")
                          .show();
                    }
                    controller = false;
                  },
                  onlongclick: () async {
                    bool error = false;
                    controller = true;
                    String? lockStatus;
                    String? closedStatus;
                    try {
                      lockStatus = await esp.getFrontDoorLockedStatus();
                      closedStatus = await esp.getFrontDoorClosedStatus();
                    } catch (e) {
                      controller = false;
                      error = true;
                      Alert(
                        type: AlertType.error,
                        context: context,
                        title: "Error",
                        desc: "Something went wrong! Try again.",
                      ).show();
                    }
                    if (error == false) {
                      var description =
                          "Lock: $lockStatus, Closed: $closedStatus";
                      controller = false;
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Status of front door",
                        desc: description,
                        style: const AlertStyle(
                          animationType: AnimationType.grow,
                          animationDuration: Duration(milliseconds: 400),
                          alertElevation: 20.0,
                          alertPadding: EdgeInsets.all(20.0),
                        ),
                      ).show();
                    }
                  },
                ),
                const SizedBox(
                  height: 12.69,
                ),
                CustomContainer(
                  name: "Back Door",
                  icon: Icons.door_back_door_outlined,
                  ontap: () => showIndexes(),
                  onswiperight: () async {
                    // Unlock door
                    controller = true;
                    print("Button pressed, sending data...");

                    var result = await esp.unlockBackDoor();

                    if (result == "e") {
                      controller = false;
                      Alert(
                              type: AlertType.error,
                              context: context,
                              title: "Error",
                              desc:
                                  "There was an error in sending your data! Please try again.")
                          .show();
                    }
                    controller = false;
                  },
                  ondoubletap: () async {
                    // Lock door
                    controller = true;
                    print("Button pressed, sending data...");
                    var result = await esp.lockBackDoor();

                    if (result == "e") {
                      controller = false;
                      Alert(
                              type: AlertType.error,
                              context: context,
                              title: "Error",
                              desc:
                                  "There was an error in sending your data! Please try again.")
                          .show();
                    }
                    controller = false;
                  },
                  onlongclick: () async {
                    bool error = false;
                    controller = true;
                    String? lockStatus;
                    String? closedStatus;
                    try {
                      lockStatus = await esp.getBackDoorLockedStatus();
                      closedStatus = await esp.getBackDoorClosedStatus();
                    } catch (e) {
                      controller = false;
                      error = true;
                      Alert(
                        type: AlertType.error,
                        context: context,
                        title: "Error",
                        desc: "Something went wrong! Try again.",
                      ).show();
                    }
                    if (error == false) {
                      var description =
                          "Lock: $lockStatus, Closed: $closedStatus";
                      controller = false;
                      Alert(
                        context: context,
                        type: AlertType.info,
                        title: "Status of back door",
                        desc: description,
                        style: const AlertStyle(
                          animationType: AnimationType.grow,
                          animationDuration: Duration(milliseconds: 400),
                          alertElevation: 20.0,
                          alertPadding: EdgeInsets.all(20.0),
                        ),
                      ).show();
                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
