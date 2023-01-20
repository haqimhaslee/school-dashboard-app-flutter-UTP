import 'package:flutter/material.dart';
import 'package:utp_in_me/pages/aboutApp.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(
    const MaterialApp(
      home: ULearn(),
    ),
  );
}

class ULearn extends StatefulWidget {
  const ULearn({super.key});

  @override
  State<ULearn> createState() => _ULearnState();
}

class _ULearnState extends State<ULearn> {
  late final WebViewController controller;

  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..loadRequest(
        Uri.parse('https://ulearn.utp.edu.my/login/index.php'),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Color.fromARGB(255, 73, 73, 73)),
        title: Text(
          'ULearn',
          style: TextStyle(color: Color.fromARGB(255, 73, 73, 73)),
        ),
        elevation: 0,
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 224, 234, 255),
        actions: [
          IconButton(
            icon: Icon(Icons.info_rounded),
            color: Color.fromARGB(255, 58, 58, 58),
            onPressed: (() => {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutApp()))
                }),
          )
        ],
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
