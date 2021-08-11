import 'package:api_dog/controllers/usersController.dart';
import 'package:api_dog/views/usersFormScreen.dart';
import 'package:api_dog/views/usersListViewSlideScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class usersListViewScreen extends StatelessWidget {

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

        print(users.length);
        if (users.length > 0) {
          return ListView.builder(
              itemCount: users == null ? 0 : users.length,
              itemBuilder: (context, int index) {
                final user = users[index];
                return SlidableWidget(
                  onDismissed: (action) => dismissSlidableItem(context, index, action),
                  child: Card(
                    margin:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    elevation: 3,
                    child: ListTile(
                      onTap: () {
                        provider.userID = user.id;
                        provider.userINDEX = index;
                        provider.process = "UPDATE";

                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => usersFormScreen()));
                      },
                      leading: CircleAvatar(
                        radius: 20,
                        child: FittedBox(
                          fit: BoxFit.fill,
                          child: Text(" "+user.score56+" "),
                        ),
                      ),
                      title: Text(
                          user.prefixT + "" + user.nameT + " " + user.lastnameT),
                      subtitle: Text(user.staffCode),
                      trailing: Icon(Icons.delete,color: Colors.grey,),
                    ),
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


