import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white, // Set the background color
      elevation: 0, // Remove the shadow
      title: Text(
        "Your App Title",
        style: TextStyle(
          color: Colors.black, // Set text color
          fontSize: 20, // Adjust the font size
        ),
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.filter_list,
            color: Colors.black, // Set the icon color
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer(); // Open the drawer
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
                    color: Colors.black, // Set text color
                    fontSize: 16, // Adjust the font size
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Notification',
                child: Text(
                  'Notification',
                  style: TextStyle(
                    color: Colors.black, // Set text color
                    fontSize: 16, // Adjust the font size
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Profile',
                child: Text(
                  'Profile',
                  style: TextStyle(
                    color: Colors.black, // Set text color
                    fontSize: 16, // Adjust the font size
                  ),
                ),
              ),
              PopupMenuItem<String>(
                value: 'Help Center',
                child: Text(
                  'Help Center',
                  style: TextStyle(
                    color: Colors.black, // Set text color
                    fontSize: 16, // Adjust the font size
                  ),
                ),
              ),
            ];
          },
          onSelected: (String selectedItem) {
            // Handle the selection here
            print("Selected: $selectedItem");
          },
          child: Row(
            children: [
              Text('Progressive Towers',style: TextStyle(color: Colors.black),),
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Colors.black, // Set the dropdown icon color
              ),
            ],
          ),
        ),
        const Spacer(), // Spacer to push Dropdown and Avatar to the end
        CircleAvatar(
          backgroundImage: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY6HwtWnw9GiLWz1B8SwYz4Pvdpku1OCC-ww&usqp=CAU'),
        ),
      ],
    );
  }
}

