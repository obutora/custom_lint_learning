import 'package:analyzer/error/listener.dart';
import 'package:custom_lint_builder/custom_lint_builder.dart';

PluginBase createPlugin() => _HogeLinter();

// Lint Ruleを登録するためのクラス
class _HogeLinter extends PluginBase {
  @override
  List<LintRule> getLintRules(CustomLintConfigs configs) {
    return [
      HogeRule(),
    ];
  }
}

class HogeRule extends DartLintRule {
  HogeRule() : super(code: _code);

  static const _code =
      LintCode(name: 'custom_name', problemMessage: 'カスタムリントのエラーメッセージ');

  @override
  void run(
    CustomLintResolver resolver,
    ErrorReporter reporter,
    CustomLintContext context,
  ) {
    // ここにLintの処理を書く
    context.registry.addVariableDeclaration((node) {
      reporter.reportErrorForNode(_code, node, []);
    });
  }
}
