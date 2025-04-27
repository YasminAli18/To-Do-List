import 'package:flutter/material.dart';

class DrawerScreen extends StatefulWidget {
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color.fromARGB(255, 38, 38, 38),
      child: Column(
        children: [
          // DrawerHeader
          DrawerHeader(
            padding: EdgeInsets.zero,
             child: Container(
              height: 500,
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Profile",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(height: 4),
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey,
                  backgroundImage: AssetImage('assets/images/jassy.png'), 
                  child: null,
                ),
                SizedBox(height: 4),
                Text(
                  "Yasmin Ali", 
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _taskInfo('Task done','2'),
                    SizedBox(width: 10),
                    _taskInfo('Task left','3'),
                  ],
                ),
              ],
            ),
             ),
          ),
          
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                _drawerItem('Settings', Icons.settings),
                _drawerItem('Account', Icons.account_circle),
                _drawerItem('Change account name', Icons.person),
                _drawerItem('Change account password', Icons.lock),
                _drawerItem('Change account Image', Icons.camera),
                
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  leading: Icon(Icons.brightness_6, color: Colors.white),
                  title: Text('Change Mode', style: TextStyle(color: Colors.white)),
                  trailing: Switch(
                    value: Theme.of(context).brightness == Brightness.dark,
                    onChanged: (value) {
                      setState(() {
                        // if (value) {
                         
                        //    Brightness.dark;
                        // } else {
                         
                        //   Brightness.light;
                        // }
                      });
                    },
                  ),
                ),
                _drawerItem('About Us', Icons.info),
                _drawerItem('FAQ', Icons.help),
                _drawerItem('Help & Feedback', Icons.help_outline),
                _drawerItem('Support US', Icons.thumb_up),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  leading: Icon(Icons.exit_to_app, color: Colors.red),
                  title: Text('Log out', style: TextStyle(color: Colors.red)),
                  onTap: () {
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _taskInfo(String label, String value) {
    return Row(
      children: [
        Text(
          label,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
        SizedBox(width: 5),
        Text(
          value,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ],
    );
  }

  Widget _drawerItem(String title, IconData icon) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 10),
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
      },
    );
  }
}
