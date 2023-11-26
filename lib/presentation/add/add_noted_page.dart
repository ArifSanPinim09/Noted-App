// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddNotedPage extends StatefulWidget {
  const AddNotedPage({Key? key}) : super(key: key);

  @override
  State<AddNotedPage> createState() => _AddNotedPageState();
}

class _AddNotedPageState extends State<AddNotedPage> {
  final GlobalKey _globalKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff252525),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          height: 70,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Color(0xff3B3B3B),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back),
            ),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            height: 100,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: Color(0xff3B3B3B),
            ),
            child: Center(
              child: Icon(Icons.save),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Form(
                key: _globalKey,
                child: Column(
                  children: [
                    TextFormField(
                      style: TextStyle(
                        fontSize: 35.0,
                        color: Colors.white,
                      ),
                      cursorHeight: 35.0,
                      cursorColor: Colors.white,
                      controller: titleController,
                      decoration: InputDecoration(
                        hintText: "Title",
                        hintStyle: TextStyle(
                          fontSize: 35.0,
                          color: Colors.white,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                    const SizedBox(
                      height: 10.0,
                    ),
                    TextFormField(
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                      cursorHeight: 20.0,
                      cursorColor: Colors.white,
                      controller: bodyController,
                      decoration: InputDecoration(
                        hintText: "Type Something....",
                        hintStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                        ),
                        border: InputBorder.none,
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
