import 'package:flutter/material.dart';

final myController = TextEditingController();

bool _check(var number) {
  if (number < 2) {
    return false;
  } else {
    for (var i = 2; i < number ~/ 2; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My Homework'),
        ),
        body: Center(
          child: Container(
            width: 300,
            padding: EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    gapPadding: 10,
                  )),
                  controller: myController,
                ),
                snackBar()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class snackBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
        child: ElevatedButton(
            onPressed: () {
              var result = '';
              int? number = int.tryParse(myController.text);
              if (myController.text.isEmpty) {
                result = 'Ban chua nhap gia tri! Vui long nhap vao 1 so nguyen!';
              } else {
                if (number == null) {
                  result = 'Ban nhap khong dung! Vui long nhap vao 1 so nguyen!';
                } else {
                  bool check = _check(number);
                  if (check) {
                    result = 'So $number la so nguyen to!';
                  } else {
                    result = 'So $number khong phai la so nguyen to!';
                  }
                }
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(
                  result,
                  style: TextStyle(fontSize: 15),
                ),
                duration: Duration(seconds: 5),
              ));
            },
            child: const Text(
              'Check',
              style: TextStyle(fontSize: 20),
            )),
      ),
    );
  }
}
