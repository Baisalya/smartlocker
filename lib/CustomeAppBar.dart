import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Text(
        "Your App Title",
        style: TextStyle(
          color: Colors.black,
          fontSize: screenWidth > 600 ? 24 : 20,
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.filter_list,
            color: Colors.black,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) {
            return <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'Home',
                child: Text(
                  'Home',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth > 600 ? 22 : 20,
                  ),
                ),
              ),
              PopupMenuDivider(), // Add a divider
              PopupMenuItem<String>(
                value: 'Notification',
                child: Text(
                  'Notification',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth > 600 ? 22 : 20,
                  ),
                ),
              ),
              PopupMenuDivider(), // Add a divider
              PopupMenuItem<String>(
                value: 'Profile',
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth > 600 ? 22 : 20,
                  ),
                ),
              ),
              PopupMenuDivider(), // Add a divider
              PopupMenuItem<String>(
                value: 'Help Center',
                child: Text(
                  'Help Center',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth > 600 ? 22 : 20,
                  ),
                ),
              ),
            ];
          },
          onSelected: (String selectedItem) {
            // Handle the selection here
            print("Selected: $selectedItem");
          },
          child: Center( // Center the content
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the row
              children: [
                Text(
                  'Progressive Towers',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: screenWidth > 600 ? 22 : 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down_rounded,
                  color: Colors.black,
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY6HwtWnw9GiLWz1B8SwYz4Pvdpku1OCC-ww&usqp=CAU'),
        ),
      ],
    );
  }
}
