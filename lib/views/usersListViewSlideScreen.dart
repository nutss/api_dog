import 'package:flutter/material.dart';
import 'package:api_dog/models/usersModel.dart';
import 'package:api_dog/controllers/usersController.dart';
import 'package:api_dog/views/usersFormScreen.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

enum SlidableAction { archive, share, edit, delete }

class SlidableWidget<T> extends StatelessWidget {
  final Widget child;
  final Function(SlidableAction action) onDismissed;

  const SlidableWidget({
    @required this.child,
    @required this.onDismissed,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Slidable(
        actionPane: SlidableDrawerActionPane(),
        child: child,

        /// left side
        /*actions: <Widget>[
      IconSlideAction(
        caption: 'Archive',
        color: Colors.blue,
        icon: Icons.archive,
        onTap: () => onDismissed(SlidableAction.archive),
      ),
      IconSlideAction(
        caption: 'Share',
        color: Colors.indigo,
        icon: Icons.share,
        onTap: () => onDismissed(SlidableAction.share),
      ),
    ],
*/

        /// right side
        secondaryActions: <Widget>[
          IconSlideAction(
            caption: 'Edit',
            color: Colors.blueAccent,
            icon: Icons.edit,
            onTap: () => onDismissed(SlidableAction.edit),
          ),
          IconSlideAction(
            caption: 'Delete',
            color: Colors.red,
            icon: Icons.delete,
            onTap: () => onDismissed(SlidableAction.delete),
          ),
        ],
      );
}

void dismissSlidableItem(
    BuildContext context, int index, SlidableAction action) {
  final provider = Provider.of<UserProvider>(context, listen: false);
  final users = provider.User;
  final user = users[index];

  switch (action) {
    case SlidableAction.edit:
      provider.userID = user.id;
      provider.userINDEX = index;
      provider.process = "UPDATE";

      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => usersFormScreen()));

      break;
    case SlidableAction.delete:

      Users statement = Users(
        id: user.id
      );

      provider.deleteData(statement);
      Utils.showSnackBar(context, 'Staff has been deleted');
      break;
  }
}

class Utils {
  static void showSnackBar(BuildContext context, String message) =>
      Scaffold.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(content: Text(message)),
        );
}
