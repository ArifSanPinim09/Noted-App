// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noted_app/data/datasource/local_datasource.dart';

import 'package:noted_app/model/data_model.dart';
import 'package:noted_app/presentation/home/home_page.dart';

class EditPage extends StatefulWidget {
  const EditPage({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note note;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  @override
  void initState() {
    titleController.text = widget.note.title;
    bodyController.text = widget.note.content;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: Container(
          height: 70,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: const Color(0xff3B3B3B),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        backgroundColor: const Color(0xff252525),
        elevation: 0,
        actions: const [],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: titleController,
                    decoration: InputDecoration(
                      hintText: widget.note.title,
                      hintStyle: GoogleFonts.poppins(
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
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: bodyController,
                    decoration: InputDecoration(
                      hintText: widget.note.content,
                      hintStyle: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            Note note = Note(
                id: widget.note.id,
                title: titleController.text,
                content: bodyController.text,
                createdAt: DateTime.now());

            LocalDatasource().updateNoteById(note);
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              return const HomePage();
            }));
          }
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
