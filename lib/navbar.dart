import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'profile.dart';

class Navbar extends StatefulWidget {
  final String username;
  final String password;

  const Navbar({
    super.key,
    required this.username,
    required this.password,
  });

  @override
  _NavbarState createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showImagePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Choose an option'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Text('Gallery'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.gallery);
                  },
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  child: const Text('Camera'),
                  onTap: () {
                    Navigator.pop(context);
                    _pickImage(ImageSource.camera);
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Wrap(
            runSpacing: 16,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(widget.username), // Display username
                accountEmail: const Text("License Number:"),
                currentAccountPicture: GestureDetector(
                  onTap: () => _showImagePicker(context),
                  child: CircleAvatar(
                    child: ClipOval(
                      child: _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : Image.asset("assets/images/upload_2.jpg"),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 113, 214, 123),
                  image: DecorationImage(
                    image: AssetImage("assets/images/forest_2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle),
                title: const Text("Profile"),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    '/profile',
                    arguments: {'username': widget.username, 'password': widget.password},
                  );
                },
              ),
              ListTile(
                leading: const Icon(Icons.line_axis),
                title: const Text("Markets"),
                onTap: () => print("Markets tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.shop),
                title: const Text("Lot Bids"),
                onTap: () => print("Lot Bids tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.notifications),
                title: const Text("Notifications"),
                onTap: () => print("Notifications tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.settings),
                title: const Text("Settings"),
                onTap: () => print("Settings tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.store),
                title: const Text("Data"),
                onTap: () => print("Data tapped"),
              ),
              const Divider(
                color: Color.fromARGB(137, 129, 114, 114),
              ),
              ListTile(
                leading: const Icon(Icons.warning),
                title: const Text("Report a Problem"),
                onTap: () => print("Report a Problem tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.mail),
                title: const Text("Contact US"),
                onTap: () => print("Contact US tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.phone),
                title: const Text("Call Us"),
                onTap: () => print("Call Us tapped"),
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Sign Out"),
                onTap: () => print("Sign Out tapped"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
