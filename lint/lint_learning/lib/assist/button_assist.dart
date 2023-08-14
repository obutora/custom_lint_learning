import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class ButtonAssist extends DartAssist {
  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) async {
    //　インスタンスを取得
    context.registry.addInstanceCreationExpression((node) {
      // カーソルがターゲットノードの範囲外なら何もしない
      if (!target.intersects(node.sourceRange)) return;

      // インスタンスの型を取得
      final createdType = node.constructorName.type.type;

      if (createdType != null && createdType.toString() == 'ElevatedButton') {
        // プロパティを取得
        final args = node.argumentList.arguments;

        final changeBuilder = reporter.createChangeBuilder(
          message: 'onPressedをHogePressedに変える',
          priority: 1000,
        );

        changeBuilder.addDartFileEdit((builder) {
          for (var element in args) {
            builder.addReplacement(element.sourceRange, (builder) {
              final replaced =
                  element.toString().replaceAll('onPressed', 'hogePressed');
              builder.write(replaced);
            });
          }
        });
      }
    });
  }
}
