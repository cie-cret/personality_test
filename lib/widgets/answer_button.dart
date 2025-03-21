import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.ansText,
    required this.selectHandler,
  });

  final String ansText;
  final void Function() selectHandler;

  @override
  Widget build(context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40),
          child: ElevatedButton(
            onPressed: selectHandler,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              backgroundColor: Colors.deepPurple.shade900,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              style: GoogleFonts.notoSansThai(fontSize: 20),
              textAlign: TextAlign.center,
              ansText,
            ),
          ),
        ));
  }
}
