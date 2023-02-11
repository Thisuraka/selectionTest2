import '../../styles.dart';
import 'package:flutter/material.dart';

@override
void initState() {}

class UsersScreen extends StatefulWidget {
  _UsersScreenState createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.only(top: 40, left: 20, right: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                  child: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                    size: 22.0,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
