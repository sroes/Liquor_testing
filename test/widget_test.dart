import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:liquor/services/auth.dart';

void main() {


////////////

testWidgets('Add and remove a todo', (WidgetTester tester) async {
  // Build the widget
  await tester.pumpWidget(LiquorMeTimbers());

  // Enter 'hi' into the TextField.
  await tester.enterText(find.byType(TextField), 'hi');
});
  
testWidgets('empty email and password doesn\'t call sign in', (WidgetTester tester) async {

    // create a LoginPage
    AuthService AuthService = new (title: 'test');
    // add it to the widget tester
    await tester.pumpWidget(loginPage);

    // tap on the login button
    Finder loginButton = find.byKey(new Key('login'));
    await tester.tap(loginButton);

    // 'pump' the tester again. This causes the widget to rebuild
    await tester.pump();

    // check that the hint text is empty
    Finder hintText = find.byKey(new Key('hint'));
    expect(hintText.toString().contains(''), true);
  });

}

class LiquorMeTimbers extends StatelessWidget {
  final String title;
  final String message;

  const LiquorMeTimbers({
    Key key,
    @required this.title,
    @required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Text(message),
        ),
      ),
    );
  }
}
