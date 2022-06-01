import 'package:flutter/material.dart';
import 'package:movie_app/src/utils/constants.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  static String routeName = "notification_page";

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  var items = List<String>.generate(10, (i) => "$i");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Row(
            children: const [
              Text(
                "Mis ",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
              Text(
                "Notificaciones",
                style: TextStyle(
                    color: Color.fromARGB(255, 242, 206, 63),
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ],
          ),
        ),
        centerTitle: true,
        elevation: 0.5,
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Constants.blueGeneric,
      ),
      body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Card(
                elevation: 3,
                child: Column(
                  children: [
                    ListTile(
                      leading: ConstrainedBox(
                        constraints: const BoxConstraints(
                          minWidth: 44,
                          minHeight: 44,
                          maxWidth: 64,
                          maxHeight: 64,
                        ),
                        child: Icon(
                            index % 2 == 0
                                ? Icons.circle_notifications_outlined
                                : Icons.info_outline,
                            color: index % 2 == 0
                                ? Color.fromARGB(248, 10, 7, 0)
                                : Color.fromARGB(255, 7, 17, 35),
                            size: 50.0),
                      ),
                      title: Text("Notification $index"),
                      subtitle: const Text(
                          "Descripción sencilla del bien, Descripción sencilla , Descripción sencilla del bien, Descripción sencilla, Descripción sencilla del bien, Descripción sencilla"),
                      trailing: Icon(
                        Icons.remove_red_eye,
                        size: 30,
                        color: index % 2 == 0
                            ? Color.fromARGB(248, 10, 7, 0)
                            : Color.fromARGB(255, 7, 17, 35),
                      ),
                      isThreeLine: true,
                      contentPadding: const EdgeInsets.all(10.0),
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => const NotificationElement(),
                        // ));
                      },
                      onLongPress: () {},
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
