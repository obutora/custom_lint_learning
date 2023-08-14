import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class HogeRule extends DartLintRule {
  const HogeRule() : super(code: _code);

  static const _code = LintCode(
    name: 'custom_name',
    problemMessage: 'hogeという名前の変数宣言に対してエラーを出すLint',
    errorSeverity: ErrorSeverity.ERROR, // しかも赤色のErrorで絶対に許さないマンする
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // ここにLintの処理を書く
    context.registry.addVariableDeclaration((node) {
      // 変数宣言のノードから変数のElementを取得する
      final element = node.declaredElement;

      if (element != null && element.name == 'hoge') {
        reporter.reportErrorForNode(_code, node, []);
      }
    });
  }
}
