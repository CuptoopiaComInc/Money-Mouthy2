import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:money_mouthy_two/widgets/button.dart';
import 'package:money_mouthy_two/screens/choose_username.dart';

// Replace these imports with your actual widget imports if needed
import '../widgets/app_logo.dart';
import '../widgets/page_title_with_indicator.dart';
import '../widgets/terms_and_conditions.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;

  const OtpVerificationScreen({
    Key? key, 
    required this.email,
  }) : super(key: key);

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final List<TextEditingController> _controllers = List.generate(
    5, 
    (index) => TextEditingController()
  );
  final List<FocusNode> _focusNodes = List.generate(
    5, 
    (index) => FocusNode()
  );

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _verifyOtp() {
    // Get the OTP code from all text fields
    final otp = _controllers.map((controller) => controller.text).join();
    
    // TODO: Implement your verification logic here
    print('Verifying OTP: $otp');
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              // Logo and app name
              const Center(
                child: AppLogo(
                ),
              ),
              
              const SizedBox(height: 40),

              // Create your account text with indicator
              const PageTitleWithIndicator(
                title: 'OTP Veficication',
                positionFactor: 0.5,
              ),
              
              const SizedBox(height: 24),
              
              // Email notification text
              Text(
                'Code has been sent to',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
              
              Text(
                widget.email,
                style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              
              const SizedBox(height: 32),
              
              // OTP input fields
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(
                  5,
                  (index) => _buildOtpTextField(index),
                ),
              ),
              
              const SizedBox(height: 16),
              
            // Alternative approach - Using Column instead of Row to avoid overflow
            Center(
              child: Column(
                children: [
                  Text(
                    "Haven't received the verification code?",
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    onPressed: () {
                      // TODO: Implement resend logic
                      print('Resending OTP code');
                    },
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(50, 30),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: const Text(
                      'Resend',
                      style: TextStyle(
                        color: Color(0xFF5159FF),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
              
              const SizedBox(height: 32),
              
              // Verify button
              PurpleButton(
                buttonText: 'Next',
                onPressed: () => {
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => ChooseUsername())
                  )
                },
              ),
              
              const SizedBox(height: 24),
              
              // Terms and conditions text
              TermsAndConditions(),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOtpTextField(int index) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: _controllers[index],
        focusNode: _focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        decoration: const InputDecoration(
          counterText: '',
          contentPadding: EdgeInsets.zero,
          border: InputBorder.none,
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
        ],
        onChanged: (value) {
          if (value.isNotEmpty && index < 4) {
            FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
          }
        },
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}