// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:noted_app/model/data_model.dart';
import 'package:noted_app/presentation/edit/eidt_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    Key? key,
    required this.note,
  }) : super(key: key);
  final Note? note;

  @override
  State<DetailPage> createState() => _EditPageState();
}

class _EditPageState extends State<DetailPage> {
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
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView(
          children: [
            Text(
              widget.note!.title,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 35.0,
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              widget.note!.content,
              style: GoogleFonts.poppins(
                color: Colors.white,
                fontSize: 20.0,
              ),
            ),
          ],
        ),
        // child: Column(
        //   children: [
        //     Form(
        //       // key: _globalKey,
        //       child: Column(
        //         children: [
        //           TextFormField(

        //             style: TextStyle(
        //               fontSize: 35.0,
        //               color: Colors.white,
        //             ),
        //             cursorColor: Colors.white,
        //             // controller: titleController,
        //             decoration: InputDecoration(
        //               hintText: "Title",
        //               hintStyle: TextStyle(
        //                 fontSize: 35.0,
        //                 color: Colors.white,
        //               ),
        //               border: InputBorder.none,
        //             ),
        //           ),
        //           SizedBox(
        //             height: 10.0,
        //           ),
        //           TextFormField(
        //             style: TextStyle(
        //               fontSize: 20.0,
        //               color: Colors.white,
        //             ),
        //             cursorColor: Colors.white,
        //             // controller: bodyController,
        //             decoration: InputDecoration(
        //               hintText: "Type Something....",
        //               hintStyle: TextStyle(
        //                 color: Colors.white,
        //                 fontSize: 20.0,
        //               ),
        //               border: InputBorder.none,
        //             ),
        //           ),
        //         ],
        //       ),
        //     )
        //   ],
        // ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return EditPage(
                  note: widget.note!,
                );
              },
            ),
          );
        },
        child: const Icon(Icons.edit),
      ),
    );
  }
}
