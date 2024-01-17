import 'dart:math';

import 'package:flutter/material.dart';

Random random = Random();
const String characters = 'abcdefghijklmnopqrstuvwxyz';

String generateRandomString(String possibleCharacters, int length) {
  Random random = Random();

  Iterable<String> randomChars = List.generate(
    length,
    (index) => possibleCharacters[random.nextInt(possibleCharacters.length)],
  );

  String randomString = randomChars.join();

  return randomString;
}

final controller = TextEditingController();

String tableName = "product_table";

InputDecoration inputDecoration = const InputDecoration(
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
    ),
  ),
);
