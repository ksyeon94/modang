import 'dart:async';

import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  List<Widget> verificationWidgets = [];
  int countdownSeconds = 180;
  late Timer countdownTimer;

  @override
  void initState() {
    super.initState();
    startCountdownTimer();
  }

  void startCountdownTimer() {
    countdownTimer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      setState(() {
        countdownSeconds--;
      });

      if (countdownSeconds == 0) {
        timer.cancel();
        // 카운트다운이 완료되면 추가 동작을 수행하세요.
      }
    });
  }

  void addVerificationTextField() {
    setState(() {
      verificationWidgets.add(
        TextField(
          decoration: InputDecoration(
            labelText: '인증번호',
            suffixIcon: Builder(
              builder: (context) {
                return CountdownWidget(countdownSeconds: countdownSeconds);
              },
            ),
          ),
        ),
      );
    });
  }

  @override
  void dispose() {
    countdownTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('회원가입')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: '아이디',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: '비밀번호',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: '비밀번호 확인',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: '휴대폰번호',
                suffixIcon: TextButton(
                  onPressed: () {
                    addVerificationTextField();
                  },
                  child: Text('인증하기'),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: verificationWidgets,
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: '이름',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: '계급',
              ),
            ),
            SizedBox(height: 16.0),
            TextField(
              decoration: InputDecoration(
                labelText: '직책',
              ),
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  duration: Duration(seconds: 1),
                  content: Text('회원가입 성공', textAlign: TextAlign.center),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                // 회원가입 버튼이 눌렸을 때 처리할 동작 추가
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pop(context);
                });
              },
              child: Text('회원가입'),
            ),
          ],
        ),
      ),
    );
  }
}

class CountdownWidget extends StatelessWidget {
  final int countdownSeconds;

  const CountdownWidget({Key? key, required this.countdownSeconds})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedTime =
        '${countdownSeconds ~/ 60}:${(countdownSeconds % 60).toString().padLeft(2, '0')}';

    return Text(
      '남은 시간: $formattedTime',
      style: TextStyle(fontSize: 18.0),
    );
  }
}
