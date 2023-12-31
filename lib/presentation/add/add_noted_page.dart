// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noted_app/data/datasource/local_datasource.dart';
import 'package:noted_app/model/data_model.dart';
import 'package:noted_app/presentation/home/home_page.dart';

class AddNotedPage extends StatefulWidget {
  const AddNotedPage({Key? key}) : super(key: key);

  @override
  State<AddNotedPage> createState() => _AddNotedPageState();
}

class _AddNotedPageState extends State<AddNotedPage> {
  final _globalKey = GlobalKey<FormState>();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
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
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            height: 100,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: const Color(0xff3B3B3B),
            ),
            child: Center(
              child: IconButton(
                onPressed: () {
                  if (_globalKey.currentState!.validate()) {
                    final Note dataModel = Note(
                      title: titleController.text,
                      content: bodyController.text,
                      createdAt: DateTime.now(),
                    );
                    LocalDatasource().insertNote(dataModel);
                    titleController.clear();
                    bodyController.clear();
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Catatan telah di simpan"),
                      ),
                    );
                    // AwesomeDialog(
                    //   context: context,
                    //   dialogType: DialogType.info,
                    //   animType: AnimType.rightSlide,
                    //   title: 'Peringatan',
                    //   desc: 'Apakah Anda Ingin Menyimpan Catatan Ini?',
                    //   btnCancelOnPress: () {},
                    //   btnOkOnPress: () {
                    //     Navigator.pop(context);
                    //   },
                    // ).show();
                  }
                },
                icon: const Icon(Icons.save),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            Form(
              key: _globalKey,
              child: Column(
                children: [
                  TextFormField(
                    style: const TextStyle(
                      fontSize: 35.0,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: titleController,
                    decoration: const InputDecoration(
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
                    style: const TextStyle(
                      fontSize: 20.0,
                      color: Colors.white,
                    ),
                    cursorColor: Colors.white,
                    controller: bodyController,
                    decoration: const InputDecoration(
                      hintText: "Type Something....",
                      hintStyle: TextStyle(
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
    );
  }
}
