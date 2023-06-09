import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../common/strings.dart';

class CustomBottomNavBar extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();
  final void Function(String) onSend;
  final String inputHint;
  final IconData iconData;

  CustomBottomNavBar({
    super.key,
    required this.onSend,
    this.inputHint = chatPlaceholder,
    this.iconData = Icons.send,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: bottomNavDecoration(),
      child: Padding(
        padding: const EdgeInsets.only(
          right: 5,
          left: 10,
          bottom: 50,
          top: 20,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: _chatTextFormField(),
            ),
            const SizedBox(width: 5),
            _sendMessageButton(),
          ],
        ),
      ),
    );
  }

  static BoxDecoration bottomNavDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(10),
          topLeft: Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.04),
            offset: const Offset(0, -10),
            blurRadius: 10,
          )
        ],
      );

  TextFormField _chatTextFormField() => TextFormField(
        controller: _textEditingController,
        enableSuggestions: false,
        onFieldSubmitted: (text) {
          if (text.isNotEmpty) {
            onSend(text);
            _textEditingController.text = '';
          }
        },
        cursorColor: Colors.greenAccent[400],
        decoration: InputDecoration(
          hintText: inputHint,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      );

  CupertinoButton _sendMessageButton() => CupertinoButton(
        padding: EdgeInsets.zero,
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Icon(
            iconData,
            color: Colors.white,
            size: 20,
          ),
        ),
        onPressed: () {
          if (_textEditingController.text.isNotEmpty) {
            onSend(_textEditingController.text);
            _textEditingController.text = '';
          }
        },
      );
}
