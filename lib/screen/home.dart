import 'package:flutter/material.dart';
import 'package:to_do/constant/color.dart';
import 'package:to_do/constant/space.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blue300,
        appBar: AppBar(
          backgroundColor: blue,
          title: Row(
            children: [
              Icon(
                Icons.check_circle_outline_outlined,
                color: white,
              ),
              w5,
              Text(
                "To Do List",
                style: TextStyle(
                  color: white,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
        body: const TaskWidget(),
        floatingActionButton: const CustomFloatingButton(),
      ),
    );
  }
}

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return ListTile(
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          title: Text(
            "Create Projects",
            style: TextStyle(color: black, fontSize: 22),
          ),
          subtitle: Text(
            "Tommorrow, 12:00PM",
            style: TextStyle(color: white),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return Divider(
          height: 1,
          thickness: 1,
          color: black,
        );
      },
      itemCount: 7,
    );
  }
}

class CustomFloatingButton extends StatelessWidget {
  const CustomFloatingButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var sh = MediaQuery.sizeOf(context).height;
    var sw = MediaQuery.sizeOf(context).width;
    return FloatingActionButton(
      backgroundColor: blue,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return Dialog(
              backgroundColor: blue300,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              child: SizedBox(
                height: sh * .6,
                width: sw * 1,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text("New Task",
                            style: TextStyle(
                              color: black,
                              fontSize: 22,
                            )),
                      ),
                      Text("What is to be done?",
                          style: TextStyle(
                            color: black,
                            fontSize: 18,
                          )),
                      const CustomTextFeilds(hint: "Enter a task", icon: null),
                      SizedBox(height: sh * .1),
                      Text("Due date",
                          style: TextStyle(color: black, fontSize: 18)),
                      CustomTextFeilds(
                        hint: "Pic a date",
                        readOnly: true,
                        icon: Icons.calendar_month,
                        onPressed: () {},
                      ),
                      CustomTextFeilds(
                        hint: "Pic a time",
                        readOnly: true,
                        icon: Icons.timer,
                        onPressed: () {},
                      ),
                      h40,
                      Align(
                        alignment: Alignment.topCenter,
                        child: ElevatedButton(
                            onPressed: () {
                              // todo
                            },
                            child: const Text("Add Task")),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      child: Icon(
        Icons.add,
        color: white,
        size: 32,
      ),
    );
  }
}

class CustomTextFeilds extends StatelessWidget {
  const CustomTextFeilds({
    super.key,
    required this.hint,
    this.readOnly = false,
    this.icon,
    this.onPressed,
  });
  final String hint;
  final bool readOnly;
  final IconData? icon;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: h40.height,
      width: double.infinity,
      child: TextField(
        readOnly: readOnly,
        decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(),
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: Icon(icon),
            )),
      ),
    );
  }
}
