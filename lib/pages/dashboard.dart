import 'package:ecg_app/components/custom_button.dart';
import 'package:ecg_app/pages/meter_screen.dart';
import 'package:ecg_app/utilities/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final amountController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  color: kMainBodyColor,
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://photo-cdn2.icons8.com/1V-w17lb5LvGEMx6ZHdaQXi7Quf0Dice0f2BTPH2xWQ/rs:fit:715:1072/czM6Ly9pY29uczgu/bW9vc2UtcHJvZC5h/c3NldHMvYXNzZXRz/L3NhdGEvb3JpZ2lu/YWwvOC82ZWFhNTAw/ZS02ZDUzLTQyNDIt/YjE0NC0wMmUxY2Vj/NjFmMzYuanBn.jpg'),
                      radius: 25,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Kofi',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        FirebaseAuth.instance.signOut();
                      },
                      icon: Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        style: TextStyle(
                          color: Colors.white,
                        ),
                        controller: amountController,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: kMainBodyColor,
                          hintText: 'Enter your preferred amount here',
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisSpacing: 15,
                        mainAxisSpacing: 15,
                        crossAxisCount: 2,
                        children: const [
                          CustomButton(
                            value: "10",
                          ),
                          CustomButton(
                            value: "20",
                          ),
                          CustomButton(
                            value: "30",
                          ),
                          CustomButton(
                            value: "40",
                          ),
                          CustomButton(
                            value: "50",
                          ),
                          CustomButton(
                            value: "60",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      MeterScreen(amount: amountController.text)));
        },
        backgroundColor: kMainBodyColor,
        child: Text('Buy'),
      ),
    );
  }
}
