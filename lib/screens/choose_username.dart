import 'package:flutter/material.dart';
import 'package:money_mouthy_two/screens/otp_verification.dart';
import '../widgets/app_logo.dart';
import '../widgets/button.dart';
import '../widgets/terms_and_conditions.dart';
import '../widgets/page_title_with_indicator.dart';

class ChooseUsername extends StatefulWidget {
  const ChooseUsername({Key? key}) : super(key: key);

  @override
  State<ChooseUsername> createState() => _ChooseUsernameState();
}

class _ChooseUsernameState extends State<ChooseUsername> {
  final _usernameController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo and App name
              const Center(
                child: AppLogo(
                ),
              ),
              const SizedBox(height: 40),
              // Create your account text with indicator
              const PageTitleWithIndicator(
                title: 'Choose Your Username',
                positionFactor: 0.7,
              ),
              const SizedBox(height: 40),
              // Name field
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  labelText: 'Your Name',
                  labelStyle: const TextStyle(
                    fontSize:10, // Font size for the label
                    color: Color.fromARGB(255, 74, 74, 74),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                ),
                style: const TextStyle(
                  fontSize:12,
                ),
              ),
              const SizedBox(height: 16),

               Text(
                "Your username is unique, you can always change it later.",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 10,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 24),
              // Next button
              // Next button
              PurpleButton(
                buttonText: 'Next',
                onPressed: () {
                  
                }
              ),
              const SizedBox(height: 120),
              // Terms & Conditions fixed near the bottom
              const Padding(
                padding: EdgeInsets.only(bottom: 20), // Adjust distance from bottom
                child: TermsAndConditions(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}