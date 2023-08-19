import 'package:analyzer/error/error.dart';
import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

class AvoidDirectCallRule extends DartLintRule {
  const AvoidDirectCallRule() : super(code: _code);

  static const _code = LintCode(
    name: 'avoid_direct_call',
    problemMessage: '直接実装クラスを呼び出さずに、抽象クラスに依存すること',
    errorSeverity: ErrorSeverity.ERROR,
  );

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // ファイルのパスを取得
    // componentを含むファイルのみを対象にする
    final path = resolver.source.uri;
    if (!path.toString().contains('component')) return;

    context.registry.addInstanceCreationExpression((node) {
      // インポートのノードからインポートのElementを取得する
      final createdType = node.constructorName.type.type;

      // インスタンスの型がImplを含む場合はエラーを出す
      if (createdType != null && createdType.toString().contains('Impl')) {
        reporter.reportErrorForNode(_code, node, []);
      }
    });
  }
}
