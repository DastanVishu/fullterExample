import 'package:flutter/material.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<ProfileEditPage> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        backgroundColor: const Color(0xFF558B2F), // Theme color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _firstNameController,
              decoration: const InputDecoration(
                labelText: "First Name",
                hintText: "Enter First Name",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white, // Background color
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _lastNameController,
              decoration: const InputDecoration(
                labelText: "Last Name",
                hintText: "Enter Last Name",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                labelText: "Username",
                hintText: "Enter New Username",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            // Email field (non-editable)
            const TextField(
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "email@example.com",
                border: OutlineInputBorder(),
                filled: true,
                fillColor: Colors.white,
              ),
              enabled: false,
            ),
            const SizedBox(height: 24.0),
            // Save Button with improved styling
            ElevatedButton(
              onPressed: () {
                // Save functionality (e.g., update profile)
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF558B2F), // Theme color
                padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                elevation: 2.0,
              ),
              child: const Text(
                "Save Changes",
                style: TextStyle(
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
