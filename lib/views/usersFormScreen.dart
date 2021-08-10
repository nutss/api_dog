import 'package:flutter/material.dart';
import 'package:api_dog/controllers/usersController.dart';
import 'package:provider/provider.dart';

class usersFormScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  // controller
  final staffCodeController = TextEditingController(); //รหัสพนักงาน
  final prefixTController = TextEditingController(); //คำนำหน้า
  final nameTController = TextEditingController(); //ชื่อ
  final lastnameTController = TextEditingController(); //นามสกุล
  final score54TController = TextEditingController(); //คะแนนปี 54
  final score55TController = TextEditingController(); //คะแนนปี 55
  final score56TController = TextEditingController(); //คะแนนปี 56

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<UserProvider>(context, listen: false);
    final users = provider.User;
    final user = users[provider.userINDEX];

    if (provider.process == "UPDATE") {
      staffCodeController.text = user.staffCode;
      prefixTController.text = user.prefixT;
      nameTController.text = user.nameT;
      lastnameTController.text = user.lastnameT;
      score54TController.text = user.score54;
      score55TController.text = user.score55;
      score56TController.text = user.score56;
    }

    //provider.userID = 0;
    //provider.process = "INSERT";

    return Scaffold(
        appBar: AppBar(
          title: Text("บันทึกข้อมูลพนักงาน"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: new InputDecoration(labelText: "รหัสพนักงาน"),
                  autofocus: true,
                  controller: staffCodeController,
                  validator: (String str) {
                    //ชื่อรายการเป็นค่าว่าง
                    if (str.isEmpty) {
                      return "กรุณาใส่รหัสพนักงาน";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "คำนำหน้า"),
                  controller: prefixTController,
                  autofocus: true,
                  validator: (String str) {
                    //ชื่อรายการเป็นค่าว่าง
                    if (str.isEmpty) {
                      return "กรุณาใส่คำนำหน้า";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "ชื่อ"),
                  controller: nameTController,
                  autofocus: true,
                  validator: (String str) {
                    //ชื่อรายการเป็นค่าว่าง
                    if (str.isEmpty) {
                      return "กรุณาใส่ชื่อ";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "นามสกุล"),
                  controller: lastnameTController,
                  autofocus: true,
                  validator: (String str) {
                    //ชื่อรายการเป็นค่าว่าง
                    if (str.isEmpty) {
                      return "กรุณาใส่ชื่อนามสกุล";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "คะแนนปี 54"),
                  controller: score54TController,
                  keyboardType: TextInputType.number,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาใส่คะแนนปี 54";
                    }
                    if (double.parse(str) <= 0) {
                      return "กรุณาใส่ คะแนนปี 54 มากกว่า 0";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "คะแนนปี 55"),
                  controller: score55TController,
                  keyboardType: TextInputType.number,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาใส่คะแนนปี 55";
                    }
                    if (double.parse(str) <= 0) {
                      return "กรุณาใส่ คะแนนปี 55 มากกว่า 0";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: new InputDecoration(labelText: "คะแนนปี 56"),
                  controller: score56TController,
                  keyboardType: TextInputType.number,
                  validator: (String str) {
                    if (str.isEmpty) {
                      return "กรุณาใส่คะแนนปี 56";
                    }
                    if (double.parse(str) <= 0) {
                      return "กรุณาใส่ คะแนนปี 56 มากกว่า 0";
                    }
                    return null;
                  },
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "บันทึก",
                      style: TextStyle(fontSize: 16.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ));
  }
}
