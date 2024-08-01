import 'package:flutter/material.dart';
import 'package:inter_library_loan_new/main.dart';
import 'package:inter_library_loan_new/screens/ai_recommendation_screen.dart';
import 'package:inter_library_loan_new/screens/book_request_screen.dart';
import 'package:inter_library_loan_new/screens/request_list_screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String name = "김단국";
  String id = "dankook123";
  String password = "********";
  String email = "dankook0406@dankook.ac.kr";
  String affiliation = "소속도서관";
  String role = "관리자 or 사서";

  void _showEditDialog(String label, String currentValue, Function(String) onSave) {
    TextEditingController controller = TextEditingController(text: currentValue);
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('$label 수정'),
          content: TextField(
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('취소'),
            ),
            TextButton(
              onPressed: () {
                onSave(controller.text);
                Navigator.of(context).pop();
              },
              child: Text('저장'),
            ),
          ],
        );
      },
    );
  }

  Widget buildUserInfoCard(String label, String info, Function(String) onSave) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(info),
        trailing: IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {
            _showEditDialog(label, info, onSave);
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('마이페이지'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Column(
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    id,
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            buildUserInfoCard('이름', name, (value) {
              setState(() {
                name = value;
              });
            }),
            buildUserInfoCard('아이디', id, (value) {
              setState(() {
                id = value;
              });
            }),
            buildUserInfoCard('비밀번호', password, (value) {
              setState(() {
                password = value;
              });
            }),
            buildUserInfoCard('이메일', email, (value) {
              setState(() {
                email = value;
              });
            }),
            buildUserInfoCard('소속', affiliation, (value) {
              setState(() {
                affiliation = value;
              });
            }),
            buildUserInfoCard('역할', role, (value) {
              setState(() {
                role = value;
              });
            }),
          ],
        ),
      ),
    );
  }
}