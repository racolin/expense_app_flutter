import 'package:flutter/material.dart';

class LoginSigninDrawer extends StatefulWidget {
  const LoginSigninDrawer({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _LoginSigninDrawerState();
  }
}

class _LoginSigninDrawerState extends State<LoginSigninDrawer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      height: 180,
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: const Text('Login'),
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
