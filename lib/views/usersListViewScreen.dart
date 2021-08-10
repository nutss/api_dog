import 'package:api_dog/controllers/usersController.dart';
import 'package:api_dog/views/usersFormScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class usersListViewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("รายชื่อพนักงาน"),
        actions: [
          IconButton(
              icon: Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                final provider =
                    Provider.of<UserProvider>(context, listen: false);

                provider.userID = 0;
                provider.process = "INSERT";

                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return usersFormScreen();
                }));
              })
        ],
      ),
      body: Consumer(builder: (context, UserProvider provider, Widget child) {
        final users = provider.User;
        int _selectedIndex = 0;

        if (users.length > -1) {
          return ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, int index) {
                final user = users[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                  elevation: 3,
                  child: ListTile(
                    selected: index == _selectedIndex,
                    onTap: () {
                      provider.userID = user.id;
                      provider.userINDEX = index;
                      provider.process = "UPDATE";

                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => usersFormScreen()));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text(user.score56),
                      ),
                    ),
                    title: Text(
                        user.prefixT + "" + user.nameT + " " + user.lastnameT),
                    subtitle: Text(user.staffCode +
                        " " +
                        user.id.toString() +
                        " " +
                        index.toString()),
                  ),
                );
              });
        } else {
          return Center(
            child: Text(
              "ไม่พบข้อมูล",
              style: TextStyle(fontSize: 35),
            ),
          );
        }
      }),
    );
  }
}
