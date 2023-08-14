import 'package:analyzer/source/source_range.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class HogeAssist extends DartAssist {
  @override
  Future<void> run(
    CustomLintResolver resolver,
    ChangeReporter reporter,
    CustomLintContext context,
    SourceRange target,
  ) async {
    context.registry.addVariableDeclaration((node) {
      // カーソルがターゲットノードの範囲外なら何もしない
      if (!target.intersects(node.sourceRange)) return;

      final element = node.declaredElement;

      if (element != null && element.name == 'hoge') {
        final changeBuilder = reporter.createChangeBuilder(
          message: 'hoge ->  : crazyPotato',
          priority: 1000,
        );

        changeBuilder.addDartFileEdit((builder) {
          builder.addSimpleReplacement(
            SourceRange(
              node.declaredElement!.nameOffset, // hogeの先頭から
              node.declaredElement!.nameLength, // hogeの4文字を置換
            ),
            'crazyPotato',
          );
        });
      }
    });
  }
}
