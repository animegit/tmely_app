import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = (ModalRoute.of(context)!.settings.arguments ?? <dynamic, dynamic>{})
        as Map;

    final String bg =
        (data['isday'] ?? false) ? 'dayback.png' : 'nightback.png';
    final Color? bgc =
        (data['isday'] ?? false) ? Colors.blue : Colors.indigo[800];

    return Scaffold(
      backgroundColor: bgc,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/$bg'),
            fit: BoxFit.cover,
          )),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic res =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': res['time']??[],
                        'location': res['location'] ??[],
                        'isday': res['isday'] ?? false,
                        'flag': res['flag']
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Colors.grey[400],
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['timezone'].toString(),
                      style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 2.0,
                          color: Colors.white),
                    )
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data['time'].toString(),
                  style: TextStyle(
                    fontSize: 70.0,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
