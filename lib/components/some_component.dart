import 'package:custom_lint_learning/impl/hoge_impl.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        final hogesd = HogeImpl();
        hogesd.hogee();
      },
      child: const Text('some'),
    );
  }
}
