import 'hoge_impl.dart';

abstract class SuperHoge {
  void hogee();

  factory SuperHoge.create() => HogeImpl();
}
