import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  bool isOtpSent = false; // Tracks if the OTP has been sent
  final TextEditingController emailController = TextEditingController();
  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        backgroundColor: const Color(0xFF558B2F), // Theme color
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go("/login"); // Navigate back
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!isOtpSent) ...[
              // Email Input Field
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "Enter your email",
                  filled: true,
                  fillColor: Colors.white, // White background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Send OTP Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF558B2F), // Theme button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  if (emailController.text.isNotEmpty) {
                    setState(() {
                      isOtpSent = true; // Switch to OTP form
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("OTP sent to your email!")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter your email")),
                    );
                  }
                },
                child: const Text(
                  "Send OTP", 
                  style: TextStyle(
                    color: Colors.white
                  ),
                  
                ),
              ),
            ] else ...[
              // OTP Input Field
              TextField(
                controller: otpController,
                decoration: InputDecoration(
                  labelText: "Enter OTP",
                  hintText: "Enter the OTP sent to your email",
                  filled: true,
                  fillColor: Colors.white, // White background
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 20),
              // Submit OTP Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF558B2F), // Theme button color
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  if (otpController.text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("OTP Verified!")),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Please enter the OTP")),
                    );
                  }
                },
                child: const Text(
                  "Verify OTP",
                  style: TextStyle(
                    color: Colors.white
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
